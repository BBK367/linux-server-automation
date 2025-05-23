#!/bin/bash

# Variables pour les seuils de ressources
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# Surveiller l'utilisation du CPU
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if [ $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc) -eq 1 ]; then
    echo "ALERTE : Utilisation du CPU au-dessus de $CPU_THRESHOLD%."
    ./alert.sh "ALERTE : Utilisation CPU élevée" "L'utilisation du CPU est de $CPU_USAGE%. Seuil de $CPU_THRESHOLD% dépassé."
fi

# Surveiller l'utilisation de la mémoire
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if [ $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc) -eq 1 ]; then
    echo "ALERTE : Utilisation de la mémoire au-dessus de $MEMORY_THRESHOLD%."
    ./alert.sh "ALERTE : Mémoire élevée" "L'utilisation de la mémoire est de $MEMORY_USAGE%. Seuil de $MEMORY_THRESHOLD% dépassé."
fi

# Surveiller l'espace disque
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "ALERTE : Utilisation du disque au-dessus de $DISK_THRESHOLD%."
    ./alert.sh "ALERTE : Espace disque faible" "L'utilisation du disque est de $DISK_USAGE%. Seuil de $DISK_THRESHOLD% dépassé."
fi
