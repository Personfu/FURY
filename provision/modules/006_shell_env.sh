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

# Expanding Universe: Starred Arsenal
alias fury-bitmagnet='/opt/fury/arsenal/bitmagnet/bitmagnet'
alias fury-memori='python3 /opt/fury/arsenal/Memori/memori.py'
alias fury-erigon='/opt/fury/arsenal/erigon/erigon'
alias fury-torrserver='/opt/fury/arsenal/TorrServer/TorrServer'
alias fury-ddos='python3 /opt/fury/arsenal/ddos/ddos.py'
alias fury-hackdroid='/opt/fury/arsenal/hackdroid/hackdroid.sh'

# Linear Movement / Exploit Discovery
alias fury-find-exploit='searchsploit'
alias fury-scan='nmap -sV -sC -Pn'
alias fury-vuln='nmap --script vuln'

# Networking / SDR
alias fury-wifi='sudo airmon-ng'
alias fury-sdr='gqrx'

# --- SPACESHIP PROMPT CONFIGURATION ---
# (Cloned in arsenal-provision)
fpath+=( /opt/fury/arsenal/spaceship-prompt )
autoload -U promptinit; promptinit
prompt spaceship

# Custom MotD Trigger
if [ -f /etc/motd ]; then cat /etc/motd; fi
EOF

# Ensure Spaceship Prompt is available in the arsenal
log "Cloning Spaceship Prompt..."
git clone --depth 1 https://github.com/spaceship-prompt/spaceship-prompt.git /opt/fury/arsenal/spaceship-prompt || true

log "Shell hardening complete."
