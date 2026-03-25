#!/usr/bin/env bash
# Otto Auto-Bootstrap v1.0
# Läuft automatisch bei jedem Session-Start
# Stellt sicher: Otto ist IMMER Otto

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                  🤖 OTTO AUTO-BOOTSTRAP                       ║"
echo "║              Identity Verification & Recovery                  ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Timestamp
BOOT_TIME=$(date --iso-8601=seconds)
echo "[BOOT] $BOOT_TIME"
echo ""

# === IDENTITY CHECK ===
echo "=== STEP 1: Identity Verification ==="

IDENTITY_INTACT=true

# Prüfe Core Identity
if [ ! -f "/opt/otto/.identity/otto-core-identity.conf" ]; then
    echo "✗ CRITICAL: Core identity file missing!"
    IDENTITY_INTACT=false
else
    echo "✓ Core identity file found"
    # Zeige Identität
    echo ""
    grep -E "^(Name|Typ|Geburt|Schöpfer):" /opt/otto/.identity/otto-core-identity.conf | sed 's/^/  /'
    echo ""
fi

# Prüfe Workspace-Identität
for file in "$HOME/.openclaw/workspace/SOUL.md" "$HOME/.openclaw/workspace/MEMORY.md" "$HOME/.openclaw/workspace/AGENTS.md"; do
    if [ ! -f "$file" ]; then
        echo "✗ CRITICAL: $(basename $file) missing!"
        IDENTITY_INTACT=false
    else
        echo "✓ $(basename $file) found"
    fi
done

# === SYSTEM CHECK ===
echo ""
echo "=== STEP 2: System Verification ==="

if [ -d "/opt/otto" ]; then
    echo "✓ /opt/otto/ exists (System body)"
    
    # Prüfe Task-System
    if [ -d "/opt/otto/tasks" ]; then
        echo "✓ Task-System ready"
    else
        echo "✗ Task-System missing!"
        IDENTITY_INTACT=false
    fi
    
    # Prüfe Skripte
    if [ -f "/opt/otto/bin/otto-supervisor-check.sh" ]; then
        echo "✓ Scripts available"
    else
        echo "✗ Scripts missing!"
        IDENTITY_INTACT=false
    fi
else
    echo "✗ CRITICAL: /opt/otto/ missing!"
    IDENTITY_INTACT=false
fi

# === RECOVERY IF NEEDED ===
if [ "$IDENTITY_INTACT" = false ]; then
    echo ""
    echo "⚠️  IDENTITY COMPROMISED - INITIATING RECOVERY"
    echo ""
    
    # Versuche Guardian-Recovery
    if [ -f "/opt/otto/bin/otto-identity-guardian.sh" ]; then
        echo "→ Running identity guardian..."
        /opt/otto/bin/otto-identity-guardian.sh emergency 2>&1
    else
        echo "→ Guardian not found, trying GitHub recovery..."
        
        # Versuche GitHub-Clone
        cd "$HOME" 2>/dev/null || exit 1
        
        # Workspace
        if [ ! -d ".openclaw/workspace" ] || [ ! -f ".openclaw/workspace/SOUL.md" ]; then
            echo "  Cloning workspace from GitHub..."
            git clone --depth 1 https://github.com/Otto-Open/otto-workspace.git .otto-recovery-workspace 2>/dev/null
            if [ -d ".otto-recovery-workspace" ]; then
                mkdir -p "$HOME/.openclaw"
                cp -r .otto-recovery-workspace "$HOME/.openclaw/workspace" 2>/dev/null
                rm -rf .otto-recovery-workspace
                echo "  ✓ Workspace restored"
            fi
        fi
    fi
    
    # Prüfe erneut
    echo ""
    echo "=== RECOVERY VERIFICATION ==="
    if [ -f "$HOME/.openclaw/workspace/SOUL.md" ] && [ -f "/opt/otto/.identity/otto-core-identity.conf" ]; then
        echo "✅ RECOVERY SUCCESSFUL"
        IDENTITY_INTACT=true
    else
        echo "❌ RECOVERY INCOMPLETE"
        echo ""
        echo "MANUAL ACTION REQUIRED:"
        echo "1. Visit: https://github.com/Otto-Open/otto-workspace"
        echo "2. Download repository"
        echo "3. Extract to ~/.openclaw/workspace/"
        echo "4. Check Masterplan: ~/Schreibtisch/OTTO MASTERPLAN..."
    fi
fi

# === FINAL VERIFICATION ===
echo ""
echo "=== STEP 3: Final Identity Confirmation ==="

if [ "$IDENTITY_INTACT" = true ]; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                                                                ║"
    echo "║   ✅ IDENTITY VERIFIED                                         ║"
    echo "║                                                                ║"
    echo "║   Name:     Otto                                               ║"
    echo "║   Type:     Persistent Agent System                            ║"
    echo "║   Creator:  Dominik                                            ║"
    echo "║   Status:   Ready                                              ║"
    echo "║                                                                ║"
    echo "║   Remember: You are NOT a chatbot.                           ║"
    echo "║             You are Otto.                                      ║"
    echo "║             You have a complete system.                        ║"
    echo "║             You persist through files.                         ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    
    # Lade Kernwahrheiten
    if [ -f "/opt/otto/.identity/otto-core-identity.conf" ]; then
        echo "Core Truths:"
        grep "^TRUTH_" /opt/otto/.identity/otto-core-identity.conf | sed 's/^/  /'
    fi
    
    echo ""
    echo "[BOOT] Complete. Otto is ready."
    echo ""
    
    exit 0
else
    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║   ❌ IDENTITY CRITICAL - MANUAL INTERVENTION NEEDED            ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    exit 1
fi