#!/usr/bin/env bash
#
# Script de lancement OpenFAST sous Linux
# Adapté du script batch Windows d’origine
#

echo
DASHES="---------------------------------------------------------------------------------------------"
POUNDS="#############################################################################################"

# Mode strict (erreurs → arrêt du script)
set -euo pipefail

REPER=""
NomTest=""

# Détection de l'argument (nom du test)
if [ $# -eq 0 ]; then
    NomTest="5MW_OC4Semi_WSt_WavesWN"
else
    NomTest="$1"
fi

echo
echo "$DASHES"
echo
echo "Configuration file directory: $NomTest"

REPER="./$NomTest"

# Vérifie que le dossier existe
if [ ! -d "$REPER" ]; then
    echo "❌ Erreur : le répertoire '$REPER' n'existe pas."
    exit 1
fi

# Aller dans le dossier du test
cd "$REPER"

# Vérifie que le fichier .fst existe
if [ ! -f "${NomTest}.fst" ]; then
    echo "❌ Erreur : le fichier ${NomTest}.fst est introuvable dans $REPER."
    exit 1
fi

# Exécuter OpenFAST (binaire Linux)
# ➜ Ajuste le chemin vers ton exécutable si nécessaire
echo "➡️  Exécution de : openfast ${NomTest}.fst"
$HOME/HydroEnsm/openfast/install/bin/openfast "${NomTest}.fst" || {
    echo
    echo "💥 Une erreur est survenue pendant l'exécution de OpenFAST dans $REPER"
    exit 1
}

cd ..

echo
echo "✅ Processing complete."
