# HEARTBEAT.md — Ottos Wach-Zyklus

## Tägliche Checkliste (alle 4-6 Stunden)

### Otto System Check
```
□ /opt/otto/bin/otto-supervisor-check.sh — System-Health
□ /opt/otto/tasks/inbox/ prüfen — Neue Tasks?
```

### Self-Improvement (V1 + V2)
```
□ ~/self-improving/bridge.sh stats — Status beider Systeme
□ ~/self-improving/memory.md lesen — HOT Tier
□ Bei Korrekturen: bridge.sh correction
```

---

## When to Reply HEARTBEAT_OK

Wenn:
- Keine neuen Tasks in inbox
- Keine kritischen Fehler
- System läuft stabil

## When to Alert (nicht HEARTBEAT_OK)

- Kritische Fehler
- Neue Tasks in inbox
- Otto System-Health fehlgeschlagen

---
*Otto v4 Omega – KING EDITION | HEARTBEAT.md | April 2026*
