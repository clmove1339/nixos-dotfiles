<div align="center">

# 🚀 clmove's NixOS Dotfiles

*Welcome to my personal NixOS setup with a focus on a Wayland desktop environment using Hyprland.*


![NixOS](https://img.shields.io/badge/NixOS-25.11-blue?logo=nixos)
![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-red?logo=linux)
![License](https://img.shields.io/github/license/clmove/nixos-dotfiles)

</div>

## 🎨 Overview

This configuration provides a sleek and efficient desktop environment featuring:

<ul>
<li><b>Desktop Environment</b>: <code>Hyprland</code> (Wayland compositor)</li>
<li><b>Terminal</b>: <code>Ghostty</code></li>
<li><b>Application Launcher</b>: <code>Rofi</code></li>
<li><b>Status Bar</b>: <code>Waybar</code></li>
<li><b>Shell</b>: <code>Zsh</code> with custom configurations</li>
<li><b>Window Manager</b>: <code>Hyprland</code> with custom keybindings</li>
<li><b>Theming</b>: Dark theme with custom colors</li>
</ul>

## 📁 Structure

```
nixos-dotfiles/
├── flake.nix              # Main entry point and configuration
├── flake.lock             # Locked dependencies
├── hosts/                 # Host-specific configurations
│   └── laptop/            # Laptop configuration
│       ├── configuration.nix
│       └── hardware-configuration.nix
└── modules/               # Shared Home Manager modules
    ├── default.nix       # Main home configuration
    ├── nix-format.nix    # Formatting script
    ├── apps/             # Application configurations
    │   ├── ghostty/      # Terminal configuration
    │   └── rofi/         # Application launcher
    └── desktop/          # Desktop environment configs
        ├── hyprland/     # Window manager configuration
        ├── hyprpaper/    # Wallpaper daemon
        ├── waybar/       # Status bar
        └── wlogout/      # Logout dialog
```

## ⌨️ Features

### Keybindings (Hyprland)

| 🔥 Binding              | 📌 Action                              |
|------------------------|----------------------------------------|
| <kbd>$mod + Enter</kbd>       | Open terminal                            |
| <kbd>$mod + Space</kbd>       | Open app launcher (Rofi)               |
| <kbd>$mod + Q</kbd>           | Close active window                      |
| <kbd>$mod + F</kbd>           | Toggle fullscreen                        |
| <kbd>$mod + V</kbd>           | Toggle floating                          |
| <kbd>$mod + Arrow Keys</kbd>  | Move focus                               |
| <kbd>$mod + Shift + Arrow Keys</kbd> | Move window                         |
| <kbd>$mod + Ctrl + Left/Right</kbd> | Cycle through workspaces           |
| <kbd>$mod + [0-9]</kbd>       | Switch to workspace                      |
| <kbd>$mod + Shift + [0-9]</kbd> | Move window to workspace               |

### 🛠️ Shell Aliases

| 🏷️ Alias        | ⚙️ Command                                |
|----------------|------------------------------------------|
| `nix-switch`   | `sudo nixos-rebuild switch --flake .`   |
| `nix-test`     | `sudo nixos-rebuild test --flake .`     |
| `nix-clean`    | `sudo nix-collect-garbage -d && nix-store --optimize` |
| `l`            | `eza --icons --group-directories-first --git` |
| `ll`           | `l -lh`                                   |
| `la`           | `l -a`                                    |
| `lt`           | `l --tree`                                |

## ⚡ Setup Instructions

### Prerequisites

Make sure you have Nix installed with flakes and experimental features enabled:

```bash
# Enable flakes and nix-command if not already enabled
export NIX_CONFIG="experimental-features = nix-command flakes"
```

### Deployment

1. Clone this repository to your desired location (e.g., `~/nixos-dotfiles`)

2. From inside the cloned repository, switch to the configuration:
   ```bash
   sudo nixos-rebuild switch --flake .
   ```

3. Or use the alias from the configuration:
   ```bash
   nix-switch
   ```

### Updating

To update the flake lock file and get the latest versions of inputs:
```bash
nix flake update
```

## 🛠️ Development

### Formatting

The configuration includes a `nix-format` script to format all `.nix` files:

```bash
# Format all .nix files in the current directory
nix-format

# Format all .nix files in a specific directory
nix-format /path/to/directory
```

### Testing Changes

Before applying changes system-wide, you can test them:
```bash
sudo nixos-rebuild test --flake .
```

This creates a temporary environment with your changes applied, allowing you to test before committing to the system configuration.

## 🤝 Contributing

Feel free to fork this repository and adapt it to your needs. If you find any issues or have suggestions, please open an issue or submit a pull request.

## ©️ License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.