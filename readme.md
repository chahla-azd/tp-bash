# Questions de réflexion

## Exercice 2.1

chmod 644 donne -rw-r--r-- : le propriétaire peut lire et écrire, le groupe et les autres peuvent seulement lire. Le fichier n’est pas exécutable par son propriétaire, car aucun bit x n’est attribué.

## Exercice 2.2

Les guillemets évitent une erreur si la variable est vide ou contient des espaces : sa valeur reste un seul argument.

## Exercice 2.3

Oui sans set -Eeuo pipefail le script ignore l’échec de tar. Il annonce une sauvegarde réussie qui n’existe pas, puis supprime les anciennes.

## Exercice 2.4

Parce que cron ne lance pas le script depuis notre dossier donc un chemin relatif ne trouverait pas les bons fichiers.

## Exercice 2.5

J’ajouterais un lint, des tests réels, un build, un déploiement et une notification ; il faudrait arrêter le pipeline avec exit 1 si le clone ou le pull, les tests, le build ou le déploiement échoue.
