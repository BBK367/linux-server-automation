#!/bin/bash

# Mise à jour des paquets du système
echo "Mise à jour des paquets du système..."
sudo apt update && sudo apt upgrade -y

# Nettoyage des paquets inutilisés
sudo apt autoremove -y

echo "Mise à jour terminée."
