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

log "Executing The Great Expansion (Future Domain)..."
git clone --depth 1 https://github.com/OWASP/Amass.git || true
git clone --depth 1 https://github.com/p1ngul1n0/blackbird.git || true
git clone --depth 1 https://github.com/megadose/holehe.git || true
git clone --depth 1 https://github.com/qeeqbox/social-analyzer.git || true
git clone --depth 1 https://github.com/urbanadventurer/WhatWeb.git || true
git clone --depth 1 https://github.com/Arno0x/DnsGen.git || true
git clone --depth 1 https://github.com/leebaird/discover.git || true

log "Executing The Great Expansion (Modern Domain)..."
git clone --depth 1 https://github.com/nccgroup/ScoutSuite.git || true
git clone --depth 1 https://github.com/RhinoSecurityLabs/pacu.git || true
git clone --depth 1 https://github.com/bettercap/bettercap.git || true
git clone --depth 1 https://github.com/zricethezav/gitleaks.git || true
git clone --depth 1 https://github.com/trufflesecurity/trufflehog.git || true
git clone --depth 1 https://github.com/kismetwireless/kismet.git || true
git clone --depth 1 https://github.com/v1s10n3r/w6.git || true
git clone --depth 1 https://github.com/byt3bl33d3r/CrackMapExec.git || true
git clone --depth 1 https://github.com/fox-it/BloodHound.py.git || true

log "Executing The Great Expansion (Legacy & Forensics Domain)..."
git clone --depth 1 https://github.com/volatilityfoundation/volatility3.git || true
git clone --depth 1 https://github.com/radareorg/radare2.git || true
git clone --depth 1 https://github.com/hashcat/hashcat.git || true
git clone --depth 1 https://github.com/openwall/john.git || true
git clone --depth 1 https://github.com/vanhauser-thc/thc-hydra.git || true
git clone --depth 1 https://github.com/lgandx/Responder.git || true
git clone --depth 1 https://github.com/fortra/impacket.git || true
git clone --depth 1 https://github.com/BloodHoundAD/BloodHound.git || true
git clone --depth 1 https://github.com/sleuthkit/sleuthkit.git || true
git clone --depth 1 https://github.com/robertdavidgraham/masscan.git || true

# Strip Metadata for Stealth
find . -name ".git" -type d -exec rm -rf {} + || true

log "Arsenal Operational."
