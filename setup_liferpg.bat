@echo off
title Installation et Lancement LifeRPG

echo === Vérification de Node.js ===
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo Node.js n'est pas installé. Installation en cours...
    powershell -Command "Invoke-WebRequest https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi -OutFile nodejs.msi"
    msiexec /i nodejs.msi /quiet /norestart
    del nodejs.msi
    echo Node.js installé avec succès !
) else (
    echo Node.js déjà installé.
)

echo.
echo === Vérification des versions ===
node -v
npm -v

echo.
echo === Installation des dépendances du projet ===
npm install

echo.
echo === Lancement du serveur de développement ===
npm run dev -- --host 127.0.0.1 --port 5175 --strictPort --open

pause
