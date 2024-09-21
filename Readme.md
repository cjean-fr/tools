## Documentation de la commande Bash pour l'exécution de scripts

### Description

Ce script Bash permet d'exécuter un script défini dans `composer.json` ou `package.json`, ou un exécutable présent dans `vendor/bin` ou `node_modules/bin`. Il est conçu pour simplifier l'exécution de commandes spécifiques à un projet, qu'il s'agisse d'un projet PHP (via Composer) ou JavaScript (via npm).

### Utilisation

```
./run-script.sh <script_name>
```

- `<script_name>` : Nom du script à exécuter. Il peut s'agir d'un script défini dans `composer.json` ou `package.json`, ou bien d'un exécutable dans `vendor/bin` ou `node_modules/bin`.

### Fonctionnement

1. **Vérification des arguments** : Le script attend un nom de script en argument. Si aucun argument n'est passé, le script affiche un message d'utilisation et se termine.
   
2. **Exécution d'un script Composer** :
   - Si un fichier `composer.json` est présent et que le script est défini dans la section des scripts de Composer, la commande `composer run <script_name>` est exécutée.

3. **Exécution d'un script npm** :
   - Si un fichier `package.json` est présent et que le script est défini dans la section des scripts de npm, la commande `npm run <script_name>` est exécutée.

4. **Exécution d'un exécutable** :
   - Si un exécutable portant le nom du script se trouve dans `vendor/bin` (pour les projets PHP utilisant Composer) ou dans `node_modules/bin` (pour les projets JavaScript), il sera exécuté directement.

5. **Affichage des scripts disponibles** :
   - Si le script ne trouve aucun script correspondant, il affiche la liste des scripts disponibles dans `composer.json` ou `package.json` (si ces fichiers existent).

6. **Gestion des erreurs** :
   - Si le script n'est pas trouvé dans `composer.json`, `package.json`, `vendor/bin`, ou `node_modules/bin`, un message d'erreur est affiché.

### Exemples

- Exécuter un script défini dans `composer.json` :

  ```bash
  ./run-script.sh lint
  ```

- Exécuter un script défini dans `package.json` :

  ```bash
  ./run-script.sh build
  ```

- Exécuter un exécutable présent dans `vendor/bin` :

  ```bash
  ./run-script.sh phpunit
  ```

### Prérequis

- Un fichier `composer.json` ou `package.json` doit être présent dans le répertoire de travail si vous souhaitez exécuter des scripts gérés par Composer ou npm.
- Des exécutables dans `vendor/bin` ou `node_modules/bin` doivent être présents si vous voulez les exécuter directement.

### Sorties

- Si le script est exécuté avec succès, le code de retour sera `0`.
- Si aucun script ne correspond, le code de retour sera `1` et une liste des scripts disponibles sera affichée.

### Contributions

Pour contribuer à l'amélioration de ce script, veuillez soumettre une pull request avec une description claire des modifications proposées.