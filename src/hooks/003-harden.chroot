#!/bin/sh
set -e

# hardener.sh
# "Legacy Dev" Grade Security Hardening
# Targeted at stealth and anti-forensics.

echo "[*] Engineering Fury OSINT Stealth Core..."

# 1. Kernel Hardening (sysctl)
cat <<EOF > /etc/sysctl.d/99-fury-hardening.conf
# Ignore ICMP broadcasts (Anti-smurf)
net.ipv4.icmp_echo_ignore_broadcasts = 1
# Don't accept source routed packets
net.ipv4.conf.all.accept_source_route = 0
# Disable Send Redirects
net.ipv4.conf.all.send_redirects = 0
# Log Martians
net.ipv4.conf.all.log_martians = 1
# Disable IPv6 (Unless explicitly needed for OSINT)
net.ipv6.conf.all.disable_ipv6 = 1
EOF

# 2. Firewall - Stealth Mode
if command -v ufw >/dev/null; then
    ufw default deny incoming
    ufw default allow outgoing
    # ufw enable (Only if running in a real system, in chroot it might fail)
fi

# 3. Disable Core Dumps (Anti-Forensics)
echo "* hard core 0" >> /etc/security/limits.conf

# 4. History Hardening
# Add timestamp to history and increase size for auditability
echo "export HISTTIMEFORMAT='%F %T '" >> /etc/skel/.zshrc
echo "export HISTSIZE=10000" >> /etc/skel/.zshrc

echo "[*] Stealth Core Engineered."
