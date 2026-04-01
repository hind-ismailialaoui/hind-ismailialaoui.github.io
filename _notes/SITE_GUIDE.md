# 📘 Guide Interne — indetrois.com

> Document de référence pour la gestion du blog. **Non publié.**

---

## 🏗️ Structure & Fichiers Clés

### Identité du site
| Élément | Fichier |
|---------|---------|
| Nom, email, description, réseaux | `_config.yml` |
| Design / styles | `assets/main.scss` |
| Texte d'accueil | `_includes/anonce.html` |
| Sources d'informations | `_data/sources.yml` |

---

## ✍️ Créer un Article

### Méthode manuelle
- **Dossier :** `_posts/` (ou `_posts/<Dossier>/` pour organiser)
- **Format :** `AAAA-MM-JJ-titre.md`
- **Front matter requis :**
  ```yaml
  ---
  layout: post
  title: "Titre"
  date: AAAA-MM-JJ HH:MM:SS +0200
  categories: Posts
  tags: [tag1, tag2]
  ---
  ```

### Méthode automatique (recommandée)
```bash
cd /Users/hindismailialaoui/Desktop/indetrois
bash scripts/new_post.sh "Titre du post"
```

### Brouillons
- **Dossier :** `_posts/Brouillon/`
- **Workflow :** 
  1. Écrire dans `Brouillon/`
  2. Déplacer vers `_posts/` racine quand prêt à publier
  3. Commit + Push

---

## 🧪 Tester en Local

```bash
bundle exec jekyll serve
```
Puis ouvrir → http://localhost:4000

---

## 📦 Publier les Changements

### 1. Vérifier l'état
```bash
git status
```

### 2. Ajouter les fichiers
```bash
git add .
# Ou pour un fichier spécifique :
git add _posts/2026-03-31-mon-article.md
```

### 3. Commiter
```bash
git commit -m "Ajoute post : AAAA-MM-JJ-titre-du-post"
```

### 4. Push vers GitHub
```bash
git push origin main
```

### ⚠️ Si le push échoue (non-fast-forward)
```bash
git pull --rebase origin main
git push origin main
```

---

## 📝 Checklist Pré-Publication

- [ ] Le fichier est dans `_posts/` (pas dans `Brouillon/`)
- [ ] Le format du nom est `AAAA-MM-JJ-titre.md`
- [ ] Les tags sont renseignés dans le front matter
- [ ] La section **Sources** est présente à la fin
- [ ] J'ai testé en local (optionnel mais recommandé)
- [ ] Le message de commit suit le format : `Ajoute post : AAAA-MM-JJ-titre`

---

## 🔗 Liens Utiles

- **Repo GitHub :** https://github.com/hind-ismailialaoui/hind-ismailialaoui.github.io
- **Site en ligne :** https://indetrois.com
- **Docs Jekyll :** https://jekyllrb.com/docs/
