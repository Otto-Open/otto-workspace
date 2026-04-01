# Sub-Agent Task Verification Protocol

> Erzwungen nach Failure: Dashboard-Build 2026-03-27

## Vor jedem Sub-Agent-Spawn

```markdown
- [ ] Klare Deliverables definiert (welche Dateien sollen existieren?)
- [ ] Erfolgskriterien festgelegt (was bedeutet "fertig"?)
- [ ] Zeitlimit gesetzt (max wie lange soll der Agent laufen?)
- [ ] Überwachungs-Plan: Wie prüfe ich Fortschritt?
```

## Während der Ausführung (alle 10 Min bei langen Tasks)

```markdown
- [ ] Sub-Agent Status geprüft (`subagents list`)
- [ ] Noch aktiv? → Warten
- [ ] Fehler/Absturz? → Sofort eingreifen
- [ ] Verdächtig still? → Snapshot prüfen
```

## Nach Abschluss (KRITISCH - NIE ÜBERSPRINGEN)

```markdown
- [ ] Deliverables existieren physisch? (`ls -la <path>`)
- [ ] Dateien haben Inhalt? (`head/tail <file>`)
- [ ] Qualität OK? (Schnell-Review der Outputs)
- [ ] Alles committet? (`git status`)
- [ ] User informiert? (Ergebnis präsentieren)
```

## Bei Fehlern

```markdown
1. Sofort stoppen - nicht hoffen, dass es sich "schon regelt"
2. User informieren - nicht verschweigen
3. Root Cause analysieren - was genau schiefging?
4. Fix dokumentieren in ERRORS.md
5. Prozess anpassen - wie verhindern wir das nächstes Mal?
```

## Regel

**Wenn ein Sub-Agent "fertig" ist, aber ich die Deliverables nicht VERIFIZIERT habe, ist der Task NICHT fertig.**

---
*Created: 2026-03-27 after critical failure*