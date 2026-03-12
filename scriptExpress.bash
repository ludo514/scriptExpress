
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

lineToWrite () {
  if [ -f "package.json" ]; then
    writeBasicScript "\\    \"dev\": \"node --watch index.js\""
    writeBasicScript "\\    \"db:seed\": \"node app/migration/seed.js\""
    writeBasicScript "\\    \"db:migrate\": \"node app/migration/createTable.js\""
    writeBasicScript "\\    \"db:reset\": \"npm run db:migrate && npm run db:seed\""
  else
    echo "Fichier introuvable"
  fi
}

writeIndex () {
  cat > index.js << EOF
  import "dotenv/config";
  import express from "express";
  import cors from "cors";
  import { xss } from "express-xss-sanitizer";


  const app = express();
  //app.use(cors())
  //app.use(xss())
  //app.use(express.json());

  app.listen(3000, () => {
    console.log(\`🚀 Server running at http://localhost:3000\`);
  });
EOF
}

expressProject () {
  echo -n "Nom du projet : "
  read nameProject

  if [ -n "$nameProject" ]; then
    mkdir $nameProject && cd $nameProject
    mkdir app
    touch .env .gitignore index.js
    writeIndex
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
    lineToWrite
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
    writeIndex

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
    lineToWrite

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


