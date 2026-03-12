
choix=$(echo -e " Express project(Back) \n Express + Vite (Back+Front) \n Vite(Front)" | fzf --height 30% --border)
basePackage="npm install express cors dotenv"
securityPackage="npm install argon2 express-xss-sanitizer jsonwebtoken"
bddPackage="npm install pg sequelize"


writeBasicScript () {
  while IFS= read -r ligne; do
    if [[ "$ligne" == *"scripts"* ]]; then
      numero=$(grep -n "$ligne" package.json | cut -d: -f1)
      sed -i "  ${numero}a$1," package.json
    fi
  done < package.json
}

lineTowrite () {
  if [ -f "package.json" ]; then
    writeBasicScript "\\    \"dev\": \"node --watch index.js\""
    writeBasicScript "\\    \"db:seed\": \"node app/migration/seed.js\""
    writeBasicScript "\\    \"db:migrate\": \"node app/migration/createTable.js\""
    writeBasicScript "\\    \"db:reset\": \"npm run db:migrate && npm run db:seed\""
  else
    echo "Fichier introuvable"
  fi
}

expressProject () {
  echo -n "Nom du projet : "
  read nameProject

  if [ -n "$nameProject" ]; then
    mkdir $nameProject && cd $nameProject
    mkdir app
    touch .env .gitignore index.js
    cd app
    mkdir config controllers middlewares migration models public routers view
    cd ..

    echo "=== Install base package ==="
    npm init
    $basePackage
    npm install ejs

    ####### security
    echo "=== Install package for web security ==="
    $securityPackage

    ####### bdd
    echo "=== Install package for bdd ==="
    $bddPackage
    lineTowrite
  fi
}

expressProjectVite () {
  echo -n "Nom du projet : "
  read nameProject

  if [ -n "$nameProject" ]; then
    mkdir $nameProject && cd $nameProject
    echo "=== Create api side (back) ==="
    mkdir api
    cd api
    mkdir config controllers middlewares migration models public routers view
    touch .env .gitignore index.js

    echo "=== Install base package ==="
    npm init
    $basePackage
    npm install ejs

    # security
    echo "=== Install package for web security ==="
    $securityPackage

    # bdd
    echo "=== Install package for bdd ==="
    $bddPackage
    lineTowrite

    cd ..
    echo "=== Create client side (front)==="
    npm create vite@latest
  fi
  echo "Erreur"

}

if [[ "$choix" == *"Express project"* ]]; then
  expressProject
elif [[ "$choix" == *"Express + Vite"* ]]; then
  expressProjectVite
else
  npm create vite@latest
fi


