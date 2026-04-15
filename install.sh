#!/bin/bash
# Alpenglow theme — optional extras installer
#
# Run after `omarchy-theme-install https://github.com/peteonrails/omarchy-alpenglow-theme`.
# Core Omarchy theming (terminals, Hyprland, Waybar, Mako, etc.) is applied
# automatically by `omarchy-theme-set`. This script handles the extras that
# aren't wired into Omarchy's theme system — CAVA, Zed, Warp, GTK, Vencord.

set -e

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- helpers ---

ask_yes_no() {
  local prompt="$1"
  local reply
  while true; do
    read -r -p "$prompt (y/N): " reply
    case "${reply:-n}" in
      [Yy]*) return 0 ;;
      [Nn]*|"") return 1 ;;
      *) echo "Please answer y or n." ;;
    esac
  done
}

backup() {
  local file="$1"
  if [[ -e "$file" ]]; then
    local ts
    ts=$(date +%Y%m%d_%H%M%S)
    cp -a "$file" "${file}.bak.${ts}"
    echo "  Backed up existing: ${file}.bak.${ts}"
  fi
}

notice() { printf "\n=== %s ===\n" "$1"; }

# --- components ---

install_cava() {
  notice "CAVA"
  if ! command -v cava >/dev/null 2>&1; then
    echo "CAVA not installed — skipping."
    return
  fi
  if ! ask_yes_no "Install Alpenglow CAVA theme?"; then return; fi

  mkdir -p "$HOME/.config/cava/themes"
  cp "$THEME_DIR/cava.theme" "$HOME/.config/cava/themes/alpenglow"
  echo "  Installed: ~/.config/cava/themes/alpenglow"

  if ask_yes_no "Update ~/.config/cava/config to use theme='alpenglow'?"; then
    local cfg="$HOME/.config/cava/config"
    if [[ -f "$cfg" ]]; then
      backup "$cfg"
      # Replace any existing theme= line (commented or not) or append
      if grep -qE "^[[:space:];]*theme[[:space:]]*=" "$cfg"; then
        sed -i -E "s|^[[:space:];]*theme[[:space:]]*=.*|theme = 'alpenglow'|" "$cfg"
      else
        printf "\n[color]\ntheme = 'alpenglow'\n" >> "$cfg"
      fi
    else
      mkdir -p "$HOME/.config/cava"
      printf "[color]\ntheme = 'alpenglow'\n" > "$cfg"
    fi
    echo "  Updated ~/.config/cava/config. Press 'c' in CAVA to reload, or restart it."
  fi
}

install_zed() {
  notice "Zed"
  if ! command -v zed >/dev/null 2>&1 && [[ ! -d "$HOME/.config/zed" ]]; then
    echo "Zed not detected — skipping."
    return
  fi
  if ! ask_yes_no "Install Alpenglow theme for Zed?"; then return; fi

  mkdir -p "$HOME/.config/zed/themes"
  cp "$THEME_DIR/aether.zed.json" "$HOME/.config/zed/themes/alpenglow.json"
  echo "  Installed: ~/.config/zed/themes/alpenglow.json"
  echo "  In Zed: cmd-shift-P → 'theme selector: toggle' → Alpenglow"
}

install_warp() {
  notice "Warp"
  if ! command -v warp-terminal >/dev/null 2>&1 && [[ ! -d "$HOME/.local/state/warp-terminal" ]]; then
    echo "Warp not detected — skipping."
    return
  fi
  if ! ask_yes_no "Install Alpenglow theme for Warp?"; then return; fi

  local dest="$HOME/.local/state/warp-terminal/themes"
  mkdir -p "$dest"
  cp "$THEME_DIR/warp.yaml" "$dest/alpenglow.yaml"
  echo "  Installed: $dest/alpenglow.yaml"
  echo "  In Warp: Settings → Appearance → Themes → Alpenglow"
}

install_gtk() {
  notice "GTK4"
  if ! ask_yes_no "Overlay Alpenglow GTK4 CSS (affects GTK4 apps like Nautilus)?"; then return; fi

  local dest="$HOME/.config/gtk-4.0/gtk.css"
  mkdir -p "$(dirname "$dest")"
  backup "$dest"
  cp "$THEME_DIR/gtk.css" "$dest"
  echo "  Installed: $dest"
  echo "  GTK4 apps may need to be restarted to pick up the change."
}

install_vencord() {
  notice "Vencord"
  if [[ ! -d "$HOME/.config/Vencord" ]]; then
    echo "Vencord not detected — skipping."
    return
  fi
  if ! ask_yes_no "Install Alpenglow Discord theme (Vencord)?"; then return; fi

  local dest="$HOME/.config/Vencord/themes"
  mkdir -p "$dest"
  cp "$THEME_DIR/vencord.theme.css" "$dest/alpenglow.theme.css"
  echo "  Installed: $dest/alpenglow.theme.css"
  echo "  In Discord: Settings → Vencord → Themes → enable alpenglow.theme.css"
}

install_waybar_scheme() {
  notice "Waybar colorization"
  local style="$HOME/.config/waybar/style.css"
  if [[ ! -f "$style" ]]; then
    echo "No ~/.config/waybar/style.css — skipping."
    return
  fi

  local marker_start="/* --- alpenglow-waybar-scheme:start --- */"
  local marker_end="/* --- alpenglow-waybar-scheme:end --- */"

  if grep -qF "$marker_start" "$style"; then
    echo "Alpenglow waybar scheme already present — skipping."
    return
  fi

  echo "This appends a warm/cool module colorization block to your waybar style.css:"
  echo "  • Clock → gold"
  echo "  • Battery → cream"
  echo "  • Audio → teal"
  echo "  • Network / Bluetooth / Active workspace → accent blue"
  echo "  • CPU → muted gray"
  echo "  • Update indicator → warm tan"
  echo "The block is fenced with markers so you can remove it cleanly later."

  if ! ask_yes_no "Append Alpenglow waybar colorization?"; then return; fi

  backup "$style"

  cat >>"$style" <<'EOF'

/* --- alpenglow-waybar-scheme:start --- */
/* Applied by omarchy-alpenglow-theme/install.sh — remove this fenced block to revert. */
#custom-omarchy                   { color: @color4; }
#workspaces button.active label,
#workspaces button.focused label  { color: @color4; }
#clock                            { color: @color3; }
#custom-weather                   { color: @color5; }
#battery                          { color: @color2; }
#pulseaudio                       { color: @color6; }
#network, #bluetooth              { color: @color4; }
#cpu                              { color: @color8; }
#custom-update                    { color: @color1; }
/* --- alpenglow-waybar-scheme:end --- */
EOF

  echo "  Appended Alpenglow waybar scheme."
  if command -v omarchy-restart-waybar >/dev/null 2>&1; then
    omarchy-restart-waybar
    echo "  Waybar restarted."
  else
    echo "  Restart waybar to see the change."
  fi
}

# --- main ---

echo "==================================================="
echo "  Alpenglow optional extras installer"
echo "==================================================="
echo
echo "Core Omarchy theming is already applied by omarchy-theme-set."
echo "This script installs the extras: CAVA, Zed, Warp, GTK4, Vencord, Waybar."
echo "Each prompt is skippable — answer 'n' to leave it unchanged."

install_cava
install_zed
install_warp
install_gtk
install_vencord
install_waybar_scheme

notice "Done"
echo "All prompted components processed."
