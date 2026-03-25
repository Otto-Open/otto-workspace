# agentscope-ref.md - AgentScope Architektur-Referenz

**Zweck:** Ottos Multi-Agent-System an AgentScope-Konzepten ausrichten

## AgentScope Konzepte → Otto Mapping

### 1. ReAct Agent → Ottos Drei-Modell-System

**AgentScope:**
```python
ReActAgent(
    name="Friday",
    sys_prompt="...",
    model=DashScopeChatModel(...),
    memory=InMemoryMemory(),
    toolkit=toolkit
)
```

**Otto:**
```
kimi-k2.5:cloud    → ReAct (Reasoning + Acting)
minimax-m2.7:cloud → Planning/Optimization
nemotron-3-super:cloud → Execution/Agentic
```

### 2. Toolkit → Otto Skills

**AgentScope:**
- `Toolkit.register_tool_function()`
- Skills = portable packages (SKILL.md + scripts/)

**Otto:**
- `~/.openclaw/skills/` → Skills laden
- SKILL.md als standardisiertes Format
- Runtime: Skill-Registry in `/opt/otto/registry/`

### 3. Memory → Otto Memory-System

**AgentScope:**
- `InMemoryMemory()` → Kurzzeit
- `ReMe` → Long-term Memory (2025-11 Release)
- Database support + compression

**Otto (aktuell):**
```
MEMORY.md           → Long-term (curated)
memory/YYYY-MM-DD.md → Daily logs (raw)
~/self-improving/   → V2 Memory (HOT/WARM/COLD)
```

**Vergleich:**
| Feature | AgentScope | Otto |
|---------|-----------|------|
| In-Memory | ✅ InMemoryMemory | ⚠️ Session-basiert |
| Persistent | ✅ ReMe/Database | ✅ Markdown-Files |
| Compression | ✅ 2025-11 | ❌ Nicht implementiert |
| Cross-Agent | ✅ Message Hub | ⚠️ File-basiert |

### 4. MsgHub → Otto Sub-Agents

**AgentScope:**
```python
async with MsgHub(
    participants=[agent1, agent2, agent3],
    announcement=Msg("Host", "Introduce yourselves.", "assistant")
) as hub:
```

**Otto:**
```yaml
# DUTIES.md
assignments:
  otto-main: [maker]
  otto-checker: [checker]
  otto-executor: [executor]
  otto-auditor: [auditor]
```

**Handoff via:**
- `tasks/inbox/pending-approval/` → Otto → Checker
- `tasks/queue/` → Checker approved → Executor
- `audit/` → Auditor loggt alles

### 5. MCP Integration

**AgentScope:**
```python
from agentscope.mcp import HttpStatelessClient
client = HttpStatelessClient(
    transport="streamable_http",
    url="https://mcp.example.com/mcp"
)
func = await client.get_callable_function("maps_geo")
```

**Otto:**
- playwright-mcp → Browser-Automation ✅
- Eigene MCP-Server möglich für:
  - Otto-Task-System
  - Memory-Abfragen
  - Git-Operations

## Empfohlene Next Steps

### Phase 1: Foundation (Done)
- [x] DUTIES.md (SOD Policy)
- [x] hooks/ (bootstrap.md, teardown.md)
- [x] compliance/ (Struktur)
- [x] playwright-mcp installiert

### Phase 2: Memory-Upgrade
- [ ] AgentScope-style InMemoryMemory für Session-Context
- [ ] Memory-Kompression (wie ReMe)
- [ ] Message Hub für Sub-Agent-Kommunikation

### Phase 3: Sub-Agent Implementation
- [ ] Otto-Checker: Review-Agent
- [ ] Otto-Executor: Execution-Agent mit Approval-Gate
- [ ] Otto-Auditor: Audit-Trail-Logger

### Phase 4: MCP-Ökosystem
- [ ] Otto-MCP-Server (Task-System anbinden)
- [ ] Git-MCP-Server (Repo-Operationen)
- [ ] Memory-MCP-Server (Langzeitgedächtnis)

## AgentScope Vorteile für Otto

1. **Produktionsreif:** AgentScope ist Apache 2.0, aktiv maintained
2. **MCP-Nativ:** Moderne Tool-Integration
3. **Memory:** ReMe für echtes Langzeitgedächtnis
4. **Multi-Agent:** MsgHub für koordinierte Agenten
5. **Extensible:** Eigene Skills/Tools einfach integrierbar

## Entscheidung

**Nicht komplett migrieren** — Otto bleibt eigenständig.
**Aber:** AgentScope-Konzepte übernehmen wo sinnvoll:
- Memory-Architektur → Inspiriert von ReMe
- Sub-Agent Kommunikation → Inspiriert von MsgHub
- MCP-Integration → Vollständig übernehmen

---
*Referenz: AgentScope v1.0.17 | Erstellt: 2026-03-25*
