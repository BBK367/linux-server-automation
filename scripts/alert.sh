#!/bin/bash

# Paramètres de l'alerte
SUBJECT="$1"
BODY="$2"
TO_EMAIL="ton_email@example.com"  # Remplace par ton adresse email

# Envoi de l'email
echo "$BODY" | mail -s "$SUBJECT" "$TO_EMAIL"

echo "Alerte envoyée à $TO_EMAIL"
