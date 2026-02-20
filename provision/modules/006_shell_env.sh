#!/bin/sh
set -e

# shell-hardening.chroot
# Injects expert-level aliases and ZSH environment into the ISO skeleton.

TARGET_ZSHRC="/etc/skel/.zshrc"

log() {
    echo "[SHELL-CONFIG] $1"
}

log "Hardening shell environment..."

cat <<'EOF' >> "$TARGET_ZSHRC"

# --- FURY OSINT EXPERT ALIASES ---
alias fury-update='sudo apt update && sudo apt upgrade -y'
alias fury-osint='/opt/fury/arsenal/spiderfoot/sf.py'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Linear Movement / Exploit Discovery
alias fury-find-exploit='searchsploit'
alias fury-scan='nmap -sV -sC -Pn'
alias fury-vuln='nmap --script vuln'

# Networking / SDR
alias fury-wifi='sudo airmon-ng'
alias fury-sdr='gqrx'

# Custom MotD Trigger
if [ -f /etc/motd ]; then cat /etc/motd; fi
EOF

log "Shell hardening complete."
