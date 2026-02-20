#!/bin/bash
# ==============================================================================
#  _______  __    __  .______     ____    ____ 
# |   ____||  |  |  | |   _  \    \   \  /   / 
# |  |__   |  |  |  | |  |_)  |    \   \/   /  
# |   __|  |  |  |  | |      /      \_    _/   
# |  |     |  `--'  | |  |\  \----.   |  |     
# |__|      \______/  | _| `._____|   |__|     
#                                              
# FURY OSINT - DEPLOYMENT UTILITY (v1.0 TITAN)
# ------------------------------------------------------------------------------
# GENIUS-GRADE ATOMIC BUILD ENGINE
# OPTIMIZED FOR: KALI-LINUX / WSL2 / NATIVE CHROOT
# AUTHOR: PRESTON FURULIE (FLLC GLOBAL)
# ==============================================================================

set -e

# Static Configuration
REPO_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." &> /dev/null && pwd )"
BUILD_DIR="$REPO_ROOT/build_cache"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

info() {
    echo -e "\e[1;36m[ARTIFACT:DEPLOY]\e[0m $1"
}

# 1. Environment Validation
if [[ $EUID -ne 0 ]]; then
   echo "[!] Elevation required. Usage: sudo bash $0"
   exit 1
fi

# 2. Dependency Resolution
info "Orchestrating system dependencies..."
apt update -qq
apt install -y live-build bc curl git gdisk -qq

# 3. Workspace Initialization
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# 4. Canonical Configuration
if [ ! -d "config" ]; then
    info "Configuring Titan-Grade Hardware Abstraction Container..."
    lb config \
        --debian-installer live \
        --distribution kali-rolling \
        --archive-areas "main contrib non-free non-free-firmware" \
        --updates true \
        --source false \
        --bootloader grub-efi \
        --iso-publisher "Fury OSINT Division" \
        --iso-volume "FURY_TITAN_V5" \
        --image-name "fury-v5-arsenal" \
        --memtest none \
        --linux-flavours amd64
fi

# 5. Modular Asset Synchronization
info "Injecting High-Fidelity Modules..."

# Manifest Injection
mkdir -p config/package-lists/
cp "$REPO_ROOT/src/manifests/fury.list.chroot" config/package-lists/

# Hook Injection (Ordered Execution)
mkdir -p config/hooks/live/
cp "$REPO_ROOT/src/hooks/"* config/hooks/live/

info "INITIATING ATOMIC SYNTHESIS (Expected Output: 25GB+)..."
lb build 2>&1 | tee "$REPO_ROOT/build_${TIMESTAMP}.log"

info "MISSION COMPLETE. Target: $BUILD_DIR/fury-v5-arsenal.iso"
