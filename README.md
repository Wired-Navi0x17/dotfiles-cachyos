# 🌐 dotfiles-cachyos

<p align="center">
  <img src="assets/fastfetch_grid.png" alt="Fastfetch Grid Showcase" width="100%"/>
</p>

<p align="center">
  <img src="assets/terminal_preview_1.png" alt="Terminal Preview 1" width="49%"/>
  <img src="assets/terminal_preview_2.png" alt="Terminal Preview 2" width="49%"/>
</p>

---

## 📂 Repository Structure

The configuration files are organized directly inside the repository:

*   [**`alacritty/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/alacritty/) — Modern OpenGL terminal emulator configuration.
    *   [`alacritty.toml`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/alacritty/alacritty.toml) — Transparent window setup and custom terminal keybindings.
*   [**`fastfetch/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fastfetch/) — Custom fastfetch sysinfo layouts and assets.
    *   [`config.jsonc`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fastfetch/config.jsonc) — Bordered catnap-inspired system info block.
    *   [`random_lain.sh`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fastfetch/random_lain.sh) — Script to cycle wallpapers/fastfetch logo backgrounds.
    *   [`lain/`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fastfetch/lain/) — Image assets directory containing local avatars.
*   [**`fish/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fish/) — Fish Shell configuration files.
    *   [`config.fish`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fish/config.fish) — Shell initialization, font resizing rules, and fastfetch hooks.
    *   [`fish_plugins`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fish/fish_plugins) — Plugin list (using `fisher`).
    *   [`fish_variables`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fish/fish_variables) — System-wide Fish environment variables.
    *   [`functions/`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fish/functions/) — Helper custom shell functions.
*   [**`keyd/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/keyd/) — Keyd keyboard remapping configuration.
    *   [`default.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/keyd/default.conf) — Custom hotkeys (Print Screen remapping for screenshots).
*   [**`kitty/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/) — Primary Kitty GPU-accelerated terminal configuration.
    *   [`kitty.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/kitty.conf) — Layouts, remote control, and custom border rules.
    *   [`current-theme.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/current-theme.conf) — Custom *Lain Wired* color theme.
    *   [`light-theme.auto.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/light-theme.auto.conf) — Backup fallback styling.
    *   [**`images/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/images/) — Custom image assets bundled for terminal rendering.
*   [**`limine/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/limine/) — Limine Bootloader configuration.
    *   [`limine.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/limine/limine.conf) — Boot entries, kernel options, and boot timing rules.
*   [**`micro/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/micro/) — Micro terminal editor.
    *   [`settings.json`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/micro/settings.json) — Catppuccin-macchiato styling configurations.
*   [**`vscode/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/vscode/) — Visual Studio Code settings.
    *   [`settings.json`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/vscode/settings.json) — Editor behaviors, telemetry disables, window configs.
*   [**`zen/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/zen/) — Zen Browser user styles.
    *   [`userChrome.css`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/zen/userChrome.css) — Custom css rules for Zen transparency and blur.

---

## 🛠️ Key Highlights

### ⚡ Kitty Border & Glow Configuration
Designed specifically for Wayland, the terminal features a transparent background (`opacity 0.70`), border-glow highlights, and removes standard window title decorations:
```ini
background_opacity 0.70
background_blur 128
window_border_width 2.5pt
hide_window_decorations yes
active_border_color #c084fc
inactive_border_color #3b1f4a
```

### 🖼️ Kitty Graphic Images (icat protocol)
Kitty includes a GPU-accelerated graphics protocol allowing images to be drawn directly inside the terminal window. This repository bundles a set of custom avatars in the [**`kitty/images/`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/kitty/images/) folder.

#### How to display these images directly in Kitty:
You can print any image in full high-resolution directly to your shell window using Kitty's built-in `icat` command:
```bash
# Print a specific avatar to the terminal
kitty +kitten icat ~/dotfiles-cachyos/kitty/images/lainPfp.jpg

# Or if you've symlinked the config:
kitty +kitten icat ~/.config/kitty/images/lainPfp.jpg
```

This protocol is utilized by the custom `fastfetch` command wrapper in Fish shell to show a random graphic logo when system specs are loaded.

> [!NOTE]
> **Copyright Disclaimer:** All image assets bundled inside this repository belong to their respective creators/artists and are included strictly for personal workspace aesthetic demonstrations. No copyright infringement is intended. If you are the owner of any asset and want it removed, please submit an issue or contact the repository owner.

### 🖼️ Dynamic Image fastfetch Logo
Whenever `fastfetch` is run, the custom wrapper function in Fish shell runs a bash script to cycle images:
```fish
function fastfetch
    set img (~/.config/fastfetch/random_lain.sh)
    kitten @ set-font-size 9
    command fastfetch --logo-type kitty-icat --logo $img $argv
    kitten @ set-font-size 14
end
```
The randomizer relies on a cached local queue (`~/.cache/lain_queue`) to ensure every image from the [fastfetch/lain/](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/fastfetch/lain/) directory is shown once before repeating.

### ⌨️ Keyd Screen Capture Remap
To capture selective screenshots (e.g. via Spectacle/system tools) on print screen press:
The configuration in [`keyd/default.conf`](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/keyd/default.conf) binds key inputs globally at the kernel-input level:
```ini
[ids]
*

[main]
selectivescreenshot = print
```

### 🌐 Zen Browser Transparency
Zen Browser achieves full transparency through the [**`userChrome.css`**](file:///home/l41n-pr0t0/workspace/GitHub/Personal/dotfiles-cachyos/zen/userChrome.css) custom CSS. Make sure you enable user chrome styling inside Zen settings and install a blur manager such as *kwin-effects-better-blur* (on KDE Plasma) to enable background blurring.

---

## ⚙️ Installation

To apply these configuration files to your own local environment:

1.  **Clone the Repository:**
    ```bash
    git clone git@github.com:Wired-Navi0x17/dotfiles-cachyos.git ~/dotfiles-cachyos
    ```

2.  **Symlink Configurations:**
    ```bash
    # Kitty Terminal (copies settings & image folders)
    ln -sf ~/dotfiles-cachyos/kitty ~/.config/kitty

    # Fish Shell
    ln -sf ~/dotfiles-cachyos/fish ~/.config/fish

    # VS Code settings
    mkdir -p ~/.config/Code/User
    ln -sf ~/dotfiles-cachyos/vscode/settings.json ~/.config/Code/User/settings.json

    # Alacritty Terminal
    ln -sf ~/dotfiles-cachyos/alacritty ~/.config/alacritty

    # Fastfetch settings
    ln -sf ~/dotfiles-cachyos/fastfetch ~/.config/fastfetch

    # Micro settings
    ln -sf ~/dotfiles-cachyos/micro ~/.config/micro

    # Zen userChrome (replace profile name with your active Firefox/Zen profile folder)
    mkdir -p ~/.config/mozilla/firefox/YOUR_PROFILE/chrome
    ln -sf ~/dotfiles-cachyos/zen/userChrome.css ~/.config/mozilla/firefox/YOUR_PROFILE/chrome/userChrome.css
    ```

3.  **Applying Keyd configuration:**
    ```bash
    sudo cp ~/dotfiles-cachyos/keyd/default.conf /etc/keyd/default.conf
    sudo systemctl restart keyd
    ```

4.  **Applying Limine boot settings:**
    > [!IMPORTANT]
    > Limine is a bootloader. Modifying its settings should be done with care. Always back up your system boot configurations before replacement.
    ```bash
    sudo cp ~/dotfiles-cachyos/limine/limine.conf /boot/limine.conf # (or your EFI boot partition path)
    ```

---

## 📝 Distributor Notes

*   **OS:** CachyOS Linux (Rolling Release, Arch-based)
*   **Desktop Environment:** KDE Plasma 6.7.3
*   **Windowing System:** Wayland
*   **Application Style:** Darkly
*   **Plasma Style:** Ant Dark
*   **Icon Set:** Papirus
*   **Cursor Set:** Catppuccin Frappé Pink
*   **Shell:** Fish (with Fisher plugin manager)
*   **Fonts:** JetBrainsMono Nerd Font
*   **Theme:** Lain Wired
