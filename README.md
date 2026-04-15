# Omarchy Alpenglow Theme

A warm-light-on-cold-mountain theme for Omarchy. Silhouetted peaks, wildfire
smoke, and the last golden hour before the sky goes blue — all calibrated
around the palette of Devils Tower at twilight.

Named for [alpenglow](https://en.wikipedia.org/wiki/Alpenglow), the phenomenon
where mountains hold warm light after the sun has set.

## Preview

![Theme preview](preview.png)

## Install

```bash
omarchy-theme-install https://github.com/peteonrails/omarchy-alpenglow-theme
omarchy-theme-set alpenglow
```

Cycle wallpapers with `omarchy-theme-bg-next` or from the Omarchy menu.

## What's Included

- Hyprland window/border tuning (`hyprland.conf`)
- Hyprlock styling (`hyprlock.conf`)
- Terminal palettes for Alacritty, Kitty, Ghostty, and Warp
- UI surfaces for GTK, Walker, mako, and SwayOSD
- App themes for btop, Neovim, VSCode, Vencord, and Aether/Zed
- Optional [CAVA](https://github.com/karlstav/cava) audio-visualizer palette (`cava.theme`)
- Eight curated wallpapers of peaks, mist, and golden-hour skies

## Palette

The palette was extracted from Devils Tower at twilight — a Wyoming sandstone
monolith silhouetted in wildfire smoke.

| Role | Color |
|------|-------|
| Background | `#121515` |
| Foreground | `#FCFBF8` |
| Accent | `#6E89C2` |
| Warm highlights | `#F8E7AE`, `#FEE88B`, `#A48364` |
| Cool highlights | `#6E89C2`, `#8BA6DF`, `#59c1c0` |

See [`colors.toml`](colors.toml) for the full 16-color ANSI palette.

## Wallpapers

<table>
  <tr>
    <td><img src="backgrounds/01-devils-tower-alpenglow.jpg" alt="Devils Tower alpenglow" /></td>
    <td><img src="backgrounds/02-alpenglow-peaks.jpg" alt="Alpenglow peaks" /></td>
    <td><img src="backgrounds/03-golden-ridge.jpg" alt="Golden ridge" /></td>
    <td><img src="backgrounds/04-dolomites-mist.jpg" alt="Dolomites mist" /></td>
  </tr>
  <tr>
    <td><img src="backgrounds/05-moonlit-valley.png" alt="Moonlit valley" /></td>
    <td><img src="backgrounds/06-devils-tower-clouds.jpg" alt="Devils Tower in clouds" /></td>
    <td><img src="backgrounds/07-purple-peak.jpg" alt="Purple peak" /></td>
    <td><img src="backgrounds/08-green-ridge.jpg" alt="Green ridge" /></td>
  </tr>
</table>

## Optional Extras

Omarchy auto-applies core theming (terminals, Hyprland, Waybar, Mako, SwayOSD, etc.)
when you run `omarchy-theme-set alpenglow`. Some extras aren't wired into
Omarchy's theme system and need a manual step. A helper script is included:

```bash
cd ~/.config/omarchy/themes/alpenglow
./install.sh
```

It detects what's installed on your system and prompts for each extra:

- **CAVA** — installs the color gradient to `~/.config/cava/themes/alpenglow` and (optionally) updates `~/.config/cava/config` to use it.
- **Zed** — installs the theme to `~/.config/zed/themes/alpenglow.json`.
- **Warp** — installs the theme to `~/.local/state/warp-terminal/themes/alpenglow.yaml`.
- **GTK4** — overlays `gtk.css` into `~/.config/gtk-4.0/gtk.css` (backs up existing).
- **Vencord** — installs the Discord theme to `~/.config/Vencord/themes/`.

Every prompt defaults to "no" — it won't touch anything without your OK. Existing
files are backed up with a `.bak.<timestamp>` suffix before replacement.

## Requirements

- Omarchy (Hyprland-based)
- A terminal with theme import support (Alacritty, Kitty, Ghostty, or Warp)

## Credits

Wallpapers are sourced from [Wallhaven](https://wallhaven.cc) — see
[CREDITS.md](CREDITS.md) for per-wallpaper attribution.

Palette built using [Aether](https://github.com/bjarneo/aether).
