#!/bin/bash

# Vérifier si le pare-feu est actif
UFW_STATUS=$(sudo ufw status | grep -i "active")
if [[ -z "$UFW_STATUS" ]]; then
    echo "ALERTE : Le pare-feu n'est pas activé."
    ./alert.sh "ALERTE : Pare-feu désactivé" "Le pare-feu UFW n'est pas activé sur ce serveur."
else
    echo "Le pare-feu est activé."
fi

# Vérifier si des mises à jour de sécurité sont disponibles
UPDATES=$(sudo apt list --upgradable 2>/dev/null | grep -i security)
if [[ -n "$UPDATES" ]]; then
    echo "ALERTE : Des mises à jour de sécurité sont disponibles."
    ./alert.sh "ALERTE : Mises à jour de sécurité" "Des mises à jour de sécurité sont disponibles : $UPDATES"
else
    echo "Aucune mise à jour de sécurité disponible."
fi
