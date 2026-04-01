#!/bin/bash
# Résumé quotidien blogwatcher pour indetrois.com - Version Telegram
# À exécuter chaque matin à 9h

cd /Users/hindismailialaoui/Desktop/indetrois

# Configuration Telegram
BOT_TOKEN="8666647524:AAF6Ypuf7-ouBW4qvRaxQocL7TJWQOY8crE"
CHAT_ID="7467725102"

# Scanner les nouveaux articles
blogwatcher scan >/dev/null 2>&1

# Récupérer tous les articles récents et formater
OUTPUT=$(blogwatcher articles -a 2>/dev/null)

# Compter les articles [new]
COUNT=$(echo "$OUTPUT" | grep -c "\[new\]" || echo "0")

if [ "$COUNT" -eq 0 ] || [ -z "$COUNT" ]; then
    MESSAGE="😴 Aucun nouvel article aujourd'hui. Profite de ta journée !"
else
    # En-tête
    MESSAGE="📰 *Inspiration du jour pour indetrois.com*
    
${COUNT} nouveaux articles détectés :

"
    
    # Extraire les lignes avec titres et URLs (limiter à 10 pour Telegram)
    TITRES=$(echo "$OUTPUT" | grep "\[new\]" | sed 's/.*\[new\] //' | head -10)
    URLS=$(echo "$OUTPUT" | grep "URL:" | sed 's/.*URL: //' | head -10)
    
    # Combiner titres et URLs
    i=1
    while IFS= read -r titre; do
        url=$(echo "$URLS" | sed -n "${i}p")
        MESSAGE="${MESSAGE}🔹 ${titre}
   → ${url}

"
        i=$((i + 1))
    done <<< "$TITRES"
    
    # Ajouter la suggestion
    MESSAGE="${MESSAGE}
💡 *Suggestion d'angle :*
Parmi ces sujets, lequel pourrait donner un article sur *« comment les humains vivent avec l'IA »* ?

---
_Généré par blogwatcher • $(date +"%d/%m/%Y à %H:%M")_"
fi

# Fonction pour échapper les caractères Markdown
escape_markdown() {
    echo "$1" | sed 's/_/\\_/g; s/\*/\\*/g; s/`/\\`/g; s/\[/\\[/g'
}

# Envoyer via Telegram API
MESSAGE_ESCAPED=$(escape_markdown "$MESSAGE")

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="${CHAT_ID}" \
    -d text="${MESSAGE_ESCAPED}" \
    -d parse_mode="Markdown" \
    >/dev/null 2>&1

# Notification macOS en fallback
osascript -e "display notification \"${COUNT} articles trouvés\" with title \"📰 Inspiration indetrois.com\""

echo "✓ Résumé envoyé sur Telegram (${COUNT} articles)"
