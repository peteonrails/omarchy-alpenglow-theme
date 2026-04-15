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

## CAVA (optional)

For [CAVA](https://github.com/karlstav/cava) users, this theme ships a
color gradient in `cava.theme`. It's not wired in automatically — CAVA reads
themes from `~/.config/cava/themes/`.

```bash
cp ~/.config/omarchy/themes/alpenglow/cava.theme ~/.config/cava/themes/alpenglow
```

Then in `~/.config/cava/config`:

```ini
[color]
theme = 'alpenglow'
```

Reload CAVA with `c` (while running) or restart it.

## Requirements

- Omarchy (Hyprland-based)
- A terminal with theme import support (Alacritty, Kitty, Ghostty, or Warp)

## Credits

Wallpapers are sourced from [Wallhaven](https://wallhaven.cc) — see
[CREDITS.md](CREDITS.md) for per-wallpaper attribution.

Palette built using [Aether](https://github.com/bjarneo/aether).
