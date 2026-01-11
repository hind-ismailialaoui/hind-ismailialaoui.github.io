#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 \"Titre de l'essai\"" >&2
  exit 1
fi

title="$*"

date_prefix=$(date +"%Y-%m-%d")
date_full=$(date +"%Y-%m-%d %H:%M:%S %z")

slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')

posts_dir="_posts/Essais"
mkdir -p "$posts_dir"

file_path="$posts_dir/${date_prefix}-${slug}.md"

if [ -e "$file_path" ]; then
  echo "File already exists: $file_path" >&2
  exit 1
fi

cat <<FRONTMATTER > "$file_path"
---
layout: post
title: "${title}"
date: ${date_full}
categories: Essais
permalink: "/:categories/:title"
author: "Hind"
tags: []
---

Commence la redaction de l'essai ici!
FRONTMATTER

echo "Created: $file_path"
