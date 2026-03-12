# Script de création de projet Express / Vite

Ce script permet de générer rapidement différents types de projets JavaScript en utilisant **Express** et/ou **Vite**.

Il utilise **fzf** pour afficher un menu interactif permettant de choisir le type de projet à créer.

---

# Prérequis

Le script nécessite **fzf** pour fonctionner.

## Installer fzf

### Linux

```bash
sudo apt install fzf
```

### Windows

```bash
winget install fzf
```

Plus d'informations sur fzf :  
https://github.com/junegunn/fzf?tab=readme-ov-file

---

# Fonctionnement du script

Lors de l'exécution, le script propose **3 types de projets**.

---

# 1. Projet Express (Backend seul)

Permet de créer un **projet Express uniquement** avec une structure de dossiers prête à l'emploi.

## Structure générée

```
project/
│
├── src/
│   ├── routes/
│   ├── controllers/
│   └── app.js
│
├── package.json
└── README.md
```

---

# 2. Projet Fullstack (Express + Vite)

Permet de créer un **projet fullstack** avec :

- un **backend Express**
- un **frontend avec Vite**

Le frontend peut utiliser différents frameworks comme :

- React
- Svelte
- ou un template Vite standard

## Structure générée

```
project/
│
├── backend/
│   └── express app
│
└── frontend/
    └── vite app
```

---

# 3. Projet Frontend avec Vite

Permet de créer un **projet frontend simple** basé sur **Vite**.

## Structure générée

```
project/
│
├── src/
├── public/
├── index.html
└── vite.config.js
```

---

# Objectif du script

Ce script permet de :

- gagner du temps lors de la création d'un nouveau projet
- automatiser la mise en place de la structure
- démarrer rapidement un projet backend, frontend ou fullstack

---

# Utilisation

Exécuter simplement le script :

```bash
./scriptExpress.bash
```

Un menu interactif apparaîtra pour choisir le type de projet à créer.

---

# Créer un alias pour lancer le script depuis n'importe où

Pour pouvoir exécuter le script depuis **n'importe quel dossier du terminal**, vous pouvez créer un **alias (raccourci)**.

---

# Linux / WSL

Ouvrir le fichier `.bashrc` :

```bash
code ~/.bashrc
```

Ajouter la ligne suivante :

```bash
alias nomAlias='/mnt/c/Users/Ludo/Desktop/dossier_qui_contient_le_script/scriptExpress.bash'
```

Enregistrer puis appliquer les modifications :

```bash
source ~/.bashrc
```

Vous pourrez ensuite lancer le script simplement avec :

```bash
nomAlias
```

---

# macOS

Même procédure que Linux mais avec le fichier :

```bash
~/.bash_profile
```

Commande :

```bash
code ~/.bash_profile
```

Ajouter l'alias :

```bash
alias nomAlias='/chemin/vers/scriptExpress.bash'
```

Appliquer les modifications :

```bash
source ~/.bash_profile
```

---

# Windows (PowerShell)

Ouvrir le fichier de profil PowerShell :

```powershell
notepad $PROFILE
```

S'il n'existe pas, PowerShell vous proposera de le créer.

Ajouter les lignes suivantes :

```powershell
function ExpressNewProject { & bash "/mnt/c/Users/Ludo/Desktop/chemin_vers_le_bash/scriptExpress.bash" }
Set-Alias -Name nom_alias -Value ExpressNewProject
```

Ensuite vous pourrez lancer le script avec :

```bash
nom_alias
```

---

# Problème possible : script non exécutable

Si le script ne se lance pas, il est possible qu'il ne soit pas **exécutable**.

Dans ce cas, exécuter la commande :

```bash
chmod +x monfichier.bash
```