# Linux Server Automation

Ce projet automatise la gestion d'un serveur Linux avec des scripts qui effectuent les actions suivantes :
- **Mise à jour du système**
- **Surveillance des ressources (CPU, mémoire, disque)**
- **Vérification de la sécurité (pare-feu, mises à jour de sécurité)**

Les alertes sont envoyées par email si un seuil critique est atteint.

#Installation et exécution

1. Cloner ce projet.
2. Rendre les scripts exécutables : `chmod +x scripts/*.sh`.
3. Exécuter les scripts selon le besoin :
   - Mise à jour du système : `./scripts/update.sh`
   - Surveiller les ressources : `./scripts/resource_monitor.sh`
   - Vérification de la sécurité : `./scripts/security_check.sh`

## Alerte par email

Les alertes sont envoyées par email lorsqu'un seuil critique est atteint (configurable dans le script `alert.sh`).

## Conclusion

Ce projet aide à automatiser la gestion de serveur, assurant une maintenance proactive et une gestion efficace des ressources.
