#!/bin/sh
set -e

# fllc-theme-engine.chroot
# High-Fidelity FLLC UI Injection
# Themes: Blacklight, Midnight, Galaxy, Cyan, Fuesca, Midnight Neon Purple Cosmic

log() {
    echo "[FLLC-UI] $1"
}

log "Engineering FLLC Visual Core..."

# 1. Colorspace Definitions
COSMIC_PURPLE="#BC13FE"
GALAXY_BLUE="#0A0E29"
MIDNIGHT_DEEP="#050510"
FUESCA_MAGENTA="#FF00FF"
CYAN_NEON="#00FFFF"
BLACKLIGHT_GREEN="#00FF00"

# 2. GTK3 Overrides (Glassmorphism & Neon)
mkdir -p /etc/skel/.config/gtk-3.0/
cat <<EOF > /etc/skel/.config/gtk-3.0/gtk.css
/* Fury OSINT Cosmic Palette */
window {
    background-color: @GALAXY_BLUE;
    color: @COSMIC_PURPLE;
}
.titlebar {
    background: linear-gradient(to right, $MIDNIGHT_DEEP, $COSMIC_PURPLE);
    color: #ffffff;
    border-bottom: 2px solid $CYAN_NEON;
}
button {
    background-color: $MIDNIGHT_DEEP;
    border: 1px solid $COSMIC_PURPLE;
    border-radius: 4px;
}
button:hover {
    box-shadow: 0 0 10px $CYAN_NEON;
}
EOF

# 3. XFCE Customization (Theming Skeleton)
mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/
# Note: In a full build, we would inject a pre-configured xfce4-desktop.xml here
# describing the Galaxy wallpaper and Neon Purple borders.

# 4. Terminal Aesthetics (Cosmic Purple Default)
mkdir -p /etc/skel/.config/xfce4/terminal/
cat <<EOF > /etc/skel/.config/xfce4/terminal/terminalrc
[Configuration]
ColorPalette=$MIDNIGHT_DEEP;#FF0000;$BLACKLIGHT_GREEN;#FFFF00;$CYAN_NEON;$COSMIC_PURPLE;$FUESCA_MAGENTA;#FFFFFF
ColorForeground=$CYAN_NEON
ColorBackground=$MIDNIGHT_DEEP
ColorCursor=$COSMIC_PURPLE
FontName=Monospace 12
ScrollingBar=TERMINAL_SCROLLBAR_NONE
EOF

log "FLLC Theme Engine Synchronized."
