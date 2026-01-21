#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 \"Titre du post\" [Dossier]" >&2
  echo "Ex:    $0 \"Mon post\"" >&2
  echo "Ex:    $0 \"Mon post\" Blogs" >&2
  exit 1
fi

title="$1"
folder="${2:-}"

posts_root="_posts"
vault_name="indetrois"

if [ -z "$folder" ]; then
  posts_dir="$posts_root"
  category="Posts"
else
  safe_folder=$(printf '%s' "$folder" | sed -E 's/[^A-Za-z0-9_-]+/_/g')
  posts_dir="$posts_root/$safe_folder"
  category="$safe_folder"
fi

mkdir -p "$posts_dir"

date_prefix=$(date +"%Y-%m-%d")
date_full=$(date +"%Y-%m-%d %H:%M:%S %z")

slug=$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')

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
categories: ${category}
permalink: "/:categories/:title"
author: "Hind"
tags: []
---

Commence la redaction ici!
FRONTMATTER

relative_path="${file_path#./}"
open "obsidian://open?vault=${vault_name}&file=${relative_path}"

echo "Created: $file_path"
