#!/bin/bash
# Résumé quotidien blogwatcher pour indetrois.com
# À exécuter chaque matin à 9h

cd /Users/hindismailialaoui/Desktop/indetrois

# Scanner les nouveaux articles
blogwatcher scan 2>/dev/null

# Récupérer les articles et filtrer pour indetrois
ARTICLES=$(blogwatcher articles -a 2>/dev/null | head -100)

# Créer le résumé Telegram
cat << EOF
📰 **Inspiration du jour pour indetrois.com**

Voici les articles tech/IA susceptibles de t'inspirer :

EOF

# Parser les articles pertinents (IA, société, éthique, outils)
echo "$ARTICLES" | grep -A5 "\[new\]" | head -50 | while read -r line; do
    if [[ $line =~ \[([0-9]+)\]\ \[new\]\ (.+) ]]; then
        ID="${BASH_REMATCH[1]}"
        TITLE="${BASH_REMATCH[2]}"
        echo "🔹 $TITLE"
    elif [[ $line =~ URL:\ (.+) ]]; then
        echo "   → ${BASH_REMATCH[1]}"
        echo ""
    fi
done

cat << EOF

💡 **Suggestion d'angle :**
Parmi ces sujets, lequel pourrait donner un article sur "comment les humains vivent avec l'IA" ?

---
Généré par blogwatcher • $(date +"%d/%m/%Y à %H:%M")
EOF
