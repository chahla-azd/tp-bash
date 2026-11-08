#!/bin/bash
set -Eeuo pipefail

REPO="${1:-}"
DIR="./projet"
LOG="./ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG"
}

if [ -z "$REPO" ]; then
    log "ERREUR : URL du dépôt manquante"
    exit 1
fi

if [ -d "$DIR" ]; then
    log "Mise à jour du dépôt"
    git -C "$DIR" pull
else
    log "Clonage du dépôt"
    git clone "$REPO" "$DIR"
fi

log "Exécution des tests"
if [ -f "$DIR/README.md" ]; then
    log "SUCCÈS : tests OK"
    exit 0
else
    log "ÉCHEC : tests échoués"
    exit 1
fi