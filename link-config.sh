#!/usr/bin/env bash
set -euo pipefail

SHARED_DIR=".shared-config"

find "$SHARED_DIR" -mindepth 1 \
     \( -type f -o -type l -o -type d \) \
     ! -iname 'README*' -print0 |
while IFS= read -r -d '' src; do
  dst="${src#${SHARED_DIR}/}"
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
done
echo "✅ linked everything except README* from $SHARED_DIR"
