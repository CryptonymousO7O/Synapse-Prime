# 🚀 Synapse Prime

Een krachtige AI-agent management applicatie gebouwd met FastAPI backend en eenvoudige HTML/JS frontend.

## 🎯 Snel aan de slag

### Optie 1: Automatische setup (Aanbevolen)

**Windows:**
```bash
start_synapse.bat
```

**Linux/Mac:**
```bash
./start_synapse.sh
```

### Optie 2: Handmatige setup

#### Vereisten
- Python 3.8 of hoger
- Een moderne webbrowser

#### Backend starten
```bash
cd ProjectSynapse/backend
python -m venv venv

# Windows:
venv\Scripts\activate.bat
# Linux/Mac:
source venv/bin/activate

pip install -r requirements.txt
uvicorn app.main:app --host 127.0.0.1 --port 8000
```

#### Frontend starten (nieuw terminal venster)
```bash
cd ProjectSynapse/frontend
python -m http.server 8080
```

#### Toegang
- 🌐 **Applicatie**: http://127.0.0.1:8080
- 🔧 **API Documentatie**: http://127.0.0.1:8000/docs

## 📁 Project Structuur

```
Synapse-Prime/
├── ProjectSynapse/
│   ├── backend/          # FastAPI server
│   │   ├── app/
│   │   │   ├── main.py   # Hoofd applicatie
│   │   │   └── api/      # API routes
│   │   ├── requirements.txt
│   │   └── .env          # Configuratie
│   └── frontend/         # HTML/JS frontend
│       ├── index.html
│       └── main.js
├── start_synapse.sh      # Linux/Mac start script
├── start_synapse.bat     # Windows start script
└── README.md
```

## 🔧 Configuratie

### Backend (.env bestand)
```env
FRONTEND_ORIGIN=http://127.0.0.1:8080
GROQ_API_KEY=your_api_key_here  # Optioneel
```

### API Endpoints
- `GET /` - Status check
- `GET /api/v1/agents` - Lijst van actieve agents
- `GET /api/v1/missions` - Lijst van missies

## 🐛 Problemen oplossen

### "Python niet gevonden"
- Installeer Python vanaf https://www.python.org/downloads/
- Zorg dat Python is toegevoegd aan je PATH

### "Port al in gebruik"
- Wijzig de poorten in de start scripts
- Controleer of andere applicaties de poorten gebruiken

### CORS errors in browser
- Controleer of de FRONTEND_ORIGIN correct is ingesteld in `.env`
- Zorg dat beide servers draaien op de juiste poorten

### Dependencies installatie faalt
```bash
# Upgrade pip eerst
pip install --upgrade pip
pip install -r requirements.txt
```

## 💡 Features

- ✅ Real-time agent monitoring
- ✅ RESTful API met FastAPI
- ✅ Eenvoudige webinterface
- ✅ CORS geconfigureerd
- ✅ Automatische setup scripts

## 📈 Ontwikkeling

### API Documentatie
Bezoek http://127.0.0.1:8000/docs voor interactieve API documentatie.

### Logs bekijken
Backend logs zijn zichtbaar in het terminal venster waar uvicorn draait.

---

**🎉 Veel plezier met Synapse Prime!**