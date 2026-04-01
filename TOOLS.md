# TOOLS.md – Ottos Werkzeuge & Umgebung
> Umgebungs-spezifische Tools, Integrations-Details, Geräte-Spitznamen.

---

## 🖥️ Systeme

### Lokaler Linux-Rechner (Otto's Home)
```
Zweck:       Smart Home, OpenClaw, tägliche Aufgaben
OS:          Linux
Hostname:    otto-IdeaPad-U430-Touch
OpenClaw:    ~/.openclaw/
Start:       openclaw start
Gateway:     http://127.0.0.1:18789 (NUR loopback!)
Dashboard:   http://127.0.0.1:8900 (ClawMetry)
```

### Hostinger KVM2 VPS (Trading)
```
Zweck:       Trading Bot, externe Services
OS:          Linux (Ubuntu)
SSH:         ssh user@[ip]
Docker:      docker ps / docker logs [container]
PM2:         pm2 list / pm2 logs / pm2 restart all
```

---

## 🔧 Installierte Tools

| Tool | System | Befehl | Zweck |
|------|--------|--------|-------|
| OpenClaw | Lokal | `openclaw` | KI-Agent Runtime |
| Ollama | Lokal | `ollama list` | LLM Runtime |
| ClawMetry | Lokal | Port 8900 | Dashboard/Metriken |
| PM2 | Hostinger | `pm2 list` | Prozess-Manager |
| Docker | Hostinger | `docker ps` | Container |

---

## 📱 Telegram

```
Bot-Name:    Otto
Chat-ID:     [in openclaw.json]
Befehle:     /start → Bot starten
```

---

## 📁 Wichtige Pfade

```
Workspace:   ~/.openclaw/workspace/
Memory:      ~/.openclaw/memory/
Config:      ~/.openclaw/openclaw.json  ← chmod 600!
Skills:      ~/.openclaw/workspace/skills/
Logs:        ~/.openclaw/logs/
System:      /opt/otto/
Backup:      /home/otto/backup-pre-v4-king-20260402/
```

---

## ⚡ Schnell-Befehle

```bash
# OpenClaw
openclaw start           # Gateway starten
openclaw status          # Status prüfen
openclaw logs            # Live-Logs

# Ollama
ollama list              # Modelle anzeigen

# Otto System
/opt/otto/bin/otto-supervisor-check.sh  # Health Check
/opt/otto/bin/otto-daily-backup.sh      # Backup
```

---

## 🌐 Wichtige URLs

| Dienst | URL |
|--------|-----|
| OpenClaw Docs | docs.openclaw.ai |
| ClawHub | clawhub.ai |
| OpenRouter | openrouter.ai/keys |
| Ollama Cloud | ollama.com |

---
Otto v4 Omega – KING EDITION | TOOLS.md | April 2026
