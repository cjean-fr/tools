#!/bin/bash

# Vérifie si un argument a été passé
if [ -z "$1" ]; then
    echo "Usage: $0 <script_name>"
    exit 1
fi

SCRIPT_NAME=$1

# Vérifie et exécute le script composer si disponible
if [ -f "composer.json" ] && grep -q "\"$SCRIPT_NAME\"" composer.json; then
    echo "Exécution de 'composer run $SCRIPT_NAME'..."
    composer run "$SCRIPT_NAME"
    exit 0
fi

# Vérifie et exécute le script npm si disponible
if [ -f "package.json" ] && grep -q "\"$SCRIPT_NAME\"" package.json; then
    echo "Exécution de 'npm run $SCRIPT_NAME'..."
    npm run "$SCRIPT_NAME"
    exit 0
fi

# Vérifie et exécute l'executable présent dans vendor/bin si disponible
if [ -f "vendor/bin/$SCRIPT_NAME" ] ; then
    echo "Exécution de 'vendor/bin/$SCRIPT_NAME'..."
    vendor/bin/$SCRIPT_NAME
    exit 0
fi

# Vérifie et exécute l'executable présent dans vendor/bin si disponible
if [ -f "node_modules/bin/$SCRIPT_NAME" ] ; then
    echo "Exécution de 'node_modules/bin/$SCRIPT_NAME'..."
    node_modules/bin/$SCRIPT_NAME
    exit 0
fi

# Si aucun des scripts n'est trouvé
echo "Script '$SCRIPT_NAME' non trouvé dans composer.json ou package.json."

# Affiche les commandes disponibles dans composer.json
if [ -f "composer.json" ]; then
    echo ""
    echo "Scripts disponibles dans composer.json :"
    composer run-script --list
fi

# Affiche les commandes disponibles dans package.json
if [ -f "package.json" ]; then
    echo ""
    echo "Scripts disponibles dans package.json :"
    npm run
fi

exit 1
