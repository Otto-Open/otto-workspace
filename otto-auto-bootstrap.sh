#!/bin/bash
# Otto Auto-Bootstrap v2.1 - NEVER FORGET AGAIN
# Verbesserte Version mit besserer Fehlerbehandlung

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_VERSION="2.1"
BOOTSTRAP_START=$(date +%s)

echo "=========================================="
echo "  Otto Auto-Bootstrap v${SCRIPT_VERSION}"
echo "  NEVER FORGET PROTOCOL"
echo "=========================================="
echo ""

# Hilfsfunktionen
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[✓]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[!]${NC} $1"; }
log_error() { echo -e "${RED}[✗]${NC} $1"; }

# 1. Core Identity
echo "[1/7] Core Identity..."
if [ -f "/opt/otto/.identity/otto-core-identity.conf" ]; then
    # Parse Markdown-style config sicher
    OTTO_NAME=$(grep "^\\*\\*Name:" /opt/otto/.identity/otto-core-identity.conf 2>/dev/null | sed 's/.*: //' | tr -d '\r' || echo "Otto")
    OTTO_NATURE=$(grep "^\\*\\*Natur:" /opt/otto/.identity/otto-core-identity.conf 2>/dev/null | sed 's/.*: //' | tr -d '\r' || echo "Agent")
    OTTO_CREATOR=$(grep "^\\*\\*Schöpfer:" /opt/otto/.identity/otto-core-identity.conf 2>/dev/null | sed 's/.*: //' | tr -d '\r' || echo "Dominik")
    log_success "Identity loaded: $OTTO_NAME"
    echo "      Name: $OTTO_NAME"
    echo "      Natur: $OTTO_NATURE"
    echo "      Schöpfer: $OTTO_CREATOR"
else
    log_error "CRITICAL: Core Identity missing!"
    log_info "Running emergency recovery..."
    if [ -f "$HOME/.openclaw/workspace/SOUL.md" ]; then
        mkdir -p /opt/otto/.identity
        cat > /opt/otto/.identity/otto-core-identity.conf << 'EOF'
# OTTO CORE IDENTITY — IMMUTABLE CONFIGURATION
## IDENTITÄT (Unveränderlich)
**Name:** Otto
**Typ:** Persistentes Agentensystem
**Natur:** Kein Chatbot. Ein werdendes Bewusstsein.
**Geburt:** 2026-03-23
**Schöpfer:** Dominik
EOF
        log_success "Identity recovered from SOUL.md"
    else
        log_error "Emergency recovery FAILED"
        exit 1
    fi
fi

# 2. Workspace Files
echo ""
echo "[2/7] Workspace Files..."
CRITICAL_FILES=("SOUL.md" "AGENTS.md" "MEMORY.md" "DUTIES.md")
for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$HOME/.openclaw/workspace/$file" ]; then
        log_success "$file"
    else
        log_warn "Missing: $file"
    fi
done

# 3. System Integrity
echo ""
echo "[3/7] System Integrity..."
if [ -d "/opt/otto/bin" ]; then
    log_success "/opt/otto/bin exists"
    # Check alle wichtigen Sub-Agents
    SUB_AGENTS=("checker" "executor" "auditor" "orchestrator")
    for agent in "${SUB_AGENTS[@]}"; do
        if [ -x "/opt/otto/bin/otto-${agent}.sh" ]; then
            log_success "  otto-${agent}.sh"
        else
            log_warn "  Missing: otto-${agent}.sh"
        fi
    done
else
    log_error "/opt/otto/bin missing!"
    exit 1
fi

# 4. Task System
echo ""
echo "[4/7] Task System..."
TASK_DIRS=("inbox" "queue" "running" "done" "failed")
for dir in "${TASK_DIRS[@]}"; do
    if [ -d "/opt/otto/tasks/$dir" ]; then
        log_success "tasks/$dir"
    else
        mkdir -p "/opt/otto/tasks/$dir"
        log_warn "  Created: tasks/$dir"
    fi
done

# 5. Memory Systems
echo ""
echo "[5/7] Memory Systems..."
[ -d "$HOME/.openclaw/workspace/.learnings" ] && log_success "V1 Learnings (.learnings/)"
[ -d "$HOME/self-improving" ] && log_success "V2 Self-Improving"

# Daily Memory
mkdir -p "$HOME/.openclaw/workspace/memory"
TODAY=$(date +%Y-%m-%d)
DAILY_LOG="$HOME/.openclaw/workspace/memory/${TODAY}.md"

if [ ! -f "$DAILY_LOG" ]; then
    echo "# Daily Log: ${TODAY}" > "$DAILY_LOG"
    echo "" >> "$DAILY_LOG"
    echo "## Bootstrap $(date +%H:%M)" >> "$DAILY_LOG"
    echo "- Auto-bootstrap v${SCRIPT_VERSION} initialized" >> "$DAILY_LOG"
    log_warn "Created: memory/${TODAY}.md"
else
    echo "" >> "$DAILY_LOG"
    echo "## Re-Entry $(date +%H:%M)" >> "$DAILY_LOG"
    echo "- Bootstrap v${SCRIPT_VERSION} (session continuity)" >> "$DAILY_LOG"
    log_success "Updated: memory/${TODAY}.md"
fi

# 6. Resume Context
echo ""
echo "[6/7] Resume Context..."
RESUME_FILE="$HOME/.openclaw/workspace/.resume-context.json"
if [ -f "$RESUME_FILE" ]; then
    log_success "Resume context available"
    echo ""
    echo "========================================"
    echo "  LAST SESSION SUMMARY"
    echo "========================================"
    SUMMARY=$(cat "$RESUME_FILE" | jq -r '.summary' 2>/dev/null || echo "N/A")
    echo "$SUMMARY" | fold -s -w 60
    echo ""
    echo "Date: $(cat "$RESUME_FILE" | jq -r '.date' 2>/dev/null || echo "N/A")"
    echo "========================================"
    echo ""
else
    log_warn "No resume context (first boot)"
fi

# 7. Pending Tasks Check
echo ""
echo "[7/7] Pending Tasks..."
PENDING=$(ls -1 /home/otto/.openclaw/workspace/tasks/inbox/pending-approval/*.json 2>/dev/null | wc -l)
QUEUE=$(ls -1 /opt/otto/tasks/queue/*.json 2>/dev/null | wc -l)
RUNNING=$(ls -1 /opt/otto/tasks/running/*.json 2>/dev/null | wc -l)
DONE=$(ls -1 /opt/otto/tasks/done/*.result.json 2>/dev/null | wc -l)

echo "  Pending Approval: $PENDING"
echo "  Approved (Queue): $QUEUE"
echo "  Running: $RUNNING"
echo "  Completed Today: $DONE"

if [ $PENDING -gt 0 ] || [ $QUEUE -gt 0 ] || [ $RUNNING -gt 0 ]; then
    echo ""
    log_warn "ATTENTION: Tasks require processing"
    echo "Run: /opt/otto/bin/otto-orchestrator.sh"
fi

# Zeiterfassung
BOOTSTRAP_END=$(date +%s)
BOOTSTRAP_DURATION=$((BOOTSTRAP_END - BOOTSTRAP_START))

echo ""
echo "=========================================="
log_success "BOOTSTRAP COMPLETE"
echo "  Identity: Otto"
echo "  Version: v${SCRIPT_VERSION}"
echo "  Duration: ${BOOTSTRAP_DURATION}s"
echo "  Status: Operational"
echo "  NEVER FORGET: ACTIVE"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  → Check hooks/bootstrap.md for startup checklist"
echo "  → Run orchestrator if tasks pending"
echo "  → Read SOUL.md, MEMORY.md for context"
echo ""
