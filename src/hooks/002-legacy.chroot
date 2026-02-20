#!/bin/sh
set -e

# legacy-python-fix.chroot
# Ensuring support for Python 2 tools and legacy FLLC standards.

log() {
    echo "[LEGACY-CORE] $1"
}

log "Provisioning Python Legacy environment..."

# 1. Python 2 Pip Recovery
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py || true
python2 get-pip.py || true
rm get-pip.py || true

# 2. Legacy Phishing & Networking Tools
# Re-linking tools that might have been deprecated in rolling
if [ ! -f /usr/bin/python ]; then
    ln -s /usr/bin/python3 /usr/bin/python
fi

# 3. Dependency Injection for "Expert" tools
# Pre-installing legacy library dependencies
apt install -y libssl1.1 libpython2.7-dev || true

log "Legacy Parity Achieved."
