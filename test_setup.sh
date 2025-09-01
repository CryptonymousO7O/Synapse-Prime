#!/bin/bash
# Test script voor Synapse Prime setup

echo "🧪 Synapse Prime Setup Test"
echo "============================"

cd "$(dirname "$0")/ProjectSynapse/backend"

# Test Python
echo "🐍 Test Python..."
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 niet gevonden"
    exit 1
fi
echo "✅ Python3: $(python3 --version)"

# Test virtual environment
echo "📦 Test virtual environment..."
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment niet gevonden. Run eerst: ./start_synapse.sh"
    exit 1
fi
echo "✅ Virtual environment bestaat"

# Test dependencies
echo "📋 Test dependencies..."
source venv/bin/activate
if ! python -c "import fastapi, uvicorn" 2>/dev/null; then
    echo "❌ Dependencies niet geïnstalleerd. Run eerst: ./start_synapse.sh"
    exit 1
fi
echo "✅ Dependencies geïnstalleerd"

# Test imports
echo "🔗 Test imports..."
if ! python -c "from app.main import app" 2>/dev/null; then
    echo "❌ Import errors gevonden"
    exit 1
fi
echo "✅ Alle imports werken"

# Test .env file
echo "⚙️  Test configuratie..."
if [ ! -f ".env" ]; then
    echo "⚠️  .env bestand niet gevonden, maar dit is optioneel"
else
    echo "✅ .env bestand gevonden"
fi

echo ""
echo "🎉 Alle tests geslaagd!"
echo "Je kunt nu Synapse Prime starten met:"
echo "   ./start_synapse.sh"