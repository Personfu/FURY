#!/bin/sh
set -e

# arsenal-sync.chroot
# (Formerly: offensive-git-pull.chroot - Renamed for environment evasion)
# SEC_CLS: TOP SECRET // FURY OSINT

log() {
    echo "[ARSENAL-SYNC] $1"
}

TARGET="/opt/fury/arsenal"
mkdir -p "$TARGET"
cd "$TARGET"

# Tiered Repository Injection
log "Synchronizing Intelligence Frameworks..."
git clone --depth 1 https://github.com/m8sec/crosslinked.git || true
git clone --depth 1 https://github.com/sherlock-project/sherlock.git || true
git clone --depth 1 https://github.com/s0md3v/Photon.git || true
git clone --depth 1 https://github.com/smicallef/spiderfoot.git || true

log "Synchronizing Operational Arsenals..."
git clone --depth 1 https://github.com/jpillora/chisel.git || true
git clone --depth 1 https://github.com/nicocha30/ligolo-ng.git || true
git clone --depth 1 https://github.com/secure77/PwnSpot.git || true
git clone --depth 1 https://github.com/FortyTwoSecurity/Linear-Movement-Suite.git || true
git clone --depth 1 https://github.com/thehackingsage/ddos.git || true
git clone --depth 1 https://github.com/thehackingsage/hackdroid.git || true
git clone --depth 1 https://github.com/bitmagnet-io/bitmagnet.git || true
git clone --depth 1 https://github.com/YouROK/TorrServer.git || true
git clone --depth 1 https://github.com/erigontech/erigon.git || true

log "Synchronizing Starred Methodology & Knowledge..."
git clone --depth 1 https://github.com/swisskyrepo/PayloadsAllTheThings.git || true
git clone --depth 1 https://github.com/drwetter/testssl.sh.git || true
git clone --depth 1 https://github.com/Werewolf-p/nmap-cheat-sheet.git || true
git clone --depth 1 https://github.com/NoorQureshi/kali-linux-cheatsheet.git || true
git clone --depth 1 https://github.com/thehackingsage/kali-wsl.git || true
git clone --depth 1 https://github.com/MemoriLabs/Memori.git || true

log "Synchronizing Specialized Intelligence..."
git clone --depth 1 https://github.com/ChainSafe/forest.git || true
git clone --depth 1 https://github.com/noislabs/drand-verify.git || true
git clone --depth 1 https://github.com/google/zx.git || true
git clone --depth 1 https://github.com/daviddias/node-dirbuster.git || true
git clone --depth 1 https://github.com/PeterCullenBurbery/wolfram-challenges-paclet.git || true
git clone --depth 1 https://github.com/PeterCullenBurbery/recreational-mathematics.git || true

# Strip Metadata for Stealth
find . -name ".git" -type d -exec rm -rf {} + || true

log "Arsenal Operational."
