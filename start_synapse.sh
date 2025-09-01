#!/bin/bash
# Synapse Prime Setup en Start Script
# Dit script helpt je om Synapse Prime snel op te zetten en te starten

set -e

echo "🚀 Synapse Prime Setup & Start"
echo "==============================="

# Controleer of Python beschikbaar is
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is niet gevonden. Installeer Python 3.8+ eerst."
    exit 1
fi

# Ga naar de backend directory
cd "$(dirname "$0")/ProjectSynapse/backend"

echo "📦 Controleer virtual environment..."
if [ ! -d "venv" ]; then
    echo "⚙️  Maak virtual environment aan..."
    python3 -m venv venv
fi

echo "📋 Installeer dependencies..."
source venv/bin/activate
pip install -q -r requirements.txt

echo "🔧 Controleer configuratie..."
if [ ! -f ".env" ]; then
    echo "⚙️  Maak .env bestand aan..."
    cat > .env << EOF
# Synapse Prime Backend Configuration
FRONTEND_ORIGIN=http://127.0.0.1:8080

# Add your Groq API key here if needed
# GROQ_API_KEY=your_api_key_here
EOF
fi

echo ""
echo "✅ Setup voltooid!"
echo ""
echo "🎯 Om Synapse Prime te starten:"
echo "1. Start de backend (dit terminal venster):"
echo "   cd ProjectSynapse/backend"
echo "   source venv/bin/activate"
echo "   uvicorn app.main:app --host 127.0.0.1 --port 8000"
echo ""
echo "2. Start de frontend (nieuw terminal venster):"
echo "   cd ProjectSynapse/frontend"
echo "   python3 -m http.server 8080"
echo ""
echo "3. Open je browser op: http://127.0.0.1:8080"
echo ""
echo "🚀 Wil je beide nu starten? (j/n)"
read -r response

if [[ "$response" =~ ^[Jj]$ ]]; then
    echo "🔥 Start backend..."
    uvicorn app.main:app --host 127.0.0.1 --port 8000 &
    BACKEND_PID=$!
    
    echo "🌐 Start frontend..."
    cd ../frontend
    python3 -m http.server 8080 &
    FRONTEND_PID=$!
    
    echo ""
    echo "✨ Synapse Prime is gestart!"
    echo "📱 Open: http://127.0.0.1:8080"
    echo "🔧 API: http://127.0.0.1:8000"
    echo ""
    echo "⏹️  Druk Ctrl+C om te stoppen"
    
    # Wacht op interrupt signal
    trap "echo '🛑 Stop Synapse Prime...'; kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; exit 0" INT
    wait
else
    echo "👍 Setup voltooid. Gebruik de instructies hierboven om handmatig te starten."
fi