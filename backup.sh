#!/bin/bash
set -Eeuo pipefail

DOSSIER="${1:-}"
DEST="${2:-./backups}"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier '$DOSSIER' n'existe pas" >&2
    exit 1
fi

mkdir -p "$DEST"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$DEST/backup_$DATE.tar.gz"

tar -czf "$ARCHIVE" "$DOSSIER"
echo "Sauvegarde créée : $ARCHIVE"

for fichier in $(find "$DEST" -name "backup_*.tar.gz" -mtime +7); do
    rm "$fichier"
    echo "Supprimé : $fichier"
done