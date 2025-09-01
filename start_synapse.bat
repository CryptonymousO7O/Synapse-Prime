@echo off
setlocal enabledelayedexpansion
title Synapse Prime Setup en Start

echo 🚀 Synapse Prime Setup ^& Start
echo ===============================

REM Controleer of Python beschikbaar is
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is niet gevonden. Installeer Python 3.8+ eerst.
    echo    Download van: https://www.python.org/downloads/
    pause
    exit /b 1
)

REM Ga naar de backend directory
cd /d "%~dp0ProjectSynapse\backend"

echo 📦 Controleer virtual environment...
if not exist "venv" (
    echo ⚙️  Maak virtual environment aan...
    python -m venv venv
)

echo 📋 Installeer dependencies...
call venv\Scripts\activate.bat
pip install -q -r requirements.txt

echo 🔧 Controleer configuratie...
if not exist ".env" (
    echo ⚙️  Maak .env bestand aan...
    (
        echo # Synapse Prime Backend Configuration
        echo FRONTEND_ORIGIN=http://127.0.0.1:8080
        echo.
        echo # Add your Groq API key here if needed
        echo # GROQ_API_KEY=your_api_key_here
    ) > .env
)

echo.
echo ✅ Setup voltooid!
echo.
echo 🎯 Om Synapse Prime te starten:
echo 1. Start de backend ^(dit terminal venster^):
echo    cd ProjectSynapse\backend
echo    venv\Scripts\activate.bat
echo    uvicorn app.main:app --host 127.0.0.1 --port 8000
echo.
echo 2. Start de frontend ^(nieuw terminal venster^):
echo    cd ProjectSynapse\frontend
echo    python -m http.server 8080
echo.
echo 3. Open je browser op: http://127.0.0.1:8080
echo.
set /p "response=🚀 Wil je beide nu starten? (j/n): "

if /i "!response!"=="j" (
    echo 🔥 Start backend...
    start "Synapse Backend" cmd /k "venv\Scripts\activate.bat && uvicorn app.main:app --host 127.0.0.1 --port 8000"
    
    timeout /t 3 >nul
    
    echo 🌐 Start frontend...
    cd ..\frontend
    start "Synapse Frontend" cmd /k "python -m http.server 8080"
    
    echo.
    echo ✨ Synapse Prime is gestart!
    echo 📱 Open: http://127.0.0.1:8080
    echo 🔧 API: http://127.0.0.1:8000
    echo.
    echo ⏹️  Sluit de terminal vensters om te stoppen
    pause
) else (
    echo 👍 Setup voltooid. Gebruik de instructies hierboven om handmatig te starten.
    pause
)