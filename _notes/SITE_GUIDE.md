Guide interne (non publie)

Changer les infos generales (nom, email, description, reseaux)

- Fichier: \_config.yml

Modifier le design (styles)

- Fichier: assets/main.scss

Modifier le texte d'accueil

- Fichier: \_includes/anonce.html

Creer un post

- Dossier: \_posts
- Sous-dossier (optionnel): \_posts/<Dossier>
- Format: AAAA-MM-JJ-titre.md

Creer un post (automatiquement)

- Script unifie: scripts/new_post.sh "Titre du post" [Dossier]

Ajouter des sources (section "Sources d'informations")

- Fichier: \_data/sources.yml

Tester en local
bundle exec jekyll serve

Enregistrer les changements avec Git
git status
git add .
git commit -m "Ajoute post : Titre du post"

Publier sur GitHub (et donc sur le site)
git push origin main

Si Git refuse le push avec non-fast-forward
git pull --rebase origin main
git push origin main
