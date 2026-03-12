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
./create-project.sh
```

Un menu interactif apparaîtra pour choisir le type de projet à créer.