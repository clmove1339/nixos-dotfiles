# clmove's NixOS Dotfiles

Welcome to my NixOS configuration! This repository contains my personal NixOS setup with a focus on a Wayland desktop environment using Hyprland.

## Overview

This configuration includes:

- **Desktop Environment**: Hyprland (Wayland compositor)
- **Terminal**: Ghostty
- **Application Launcher**: Rofi
- **Status Bar**: Waybar
- **Shell**: Zsh with custom configurations
- **Window Manager**: Hyprland with custom keybindings
- **Theming**: Dark theme with custom colors

## Structure

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
    ├── ghostty/         # Terminal configuration
    ├── hyprland/        # Window manager configuration
    ├── hyprpaper/       # Wallpaper daemon
    ├── rofi/            # Application launcher
    └── waybar/          # Status bar
```

## Features

### Keybindings (Hyprland)

| Binding              | Action                              |
|----------------------|--------------------------------------|
| `$mod + Enter`       | Open terminal                        |
| `$mod + Space`       | Open app launcher (Rofi)             |
| `$mod + Q`           | Close active window                  |
| `$mod + F`           | Toggle fullscreen                    |
| `$mod + V`           | Toggle floating                      |
| `$mod + Arrow Keys`  | Move focus                           |
| `$mod + Shift + Arrow Keys` | Move window                     |
| `$mod + Ctrl + Left/Right` | Cycle through workspaces      |
| `$mod + [0-9]`       | Switch to workspace                  |
| `$mod + Shift + [0-9]` | Move window to workspace           |

### Shell Aliases

| Alias        | Command                                |
|--------------|-----------------------------------------|
| `nix-switch` | `sudo nixos-rebuild switch --flake .`  |
| `nix-test`   | `sudo nixos-rebuild test --flake .`    |
| `nix-clean`  | `sudo nix-collect-garbage -d && nix-store --optimize` |
| `l`          | `eza --icons --group-directories-first --git` |
| `ll`         | `l -lh`                                |
| `la`         | `l -a`                                 |
| `lt`         | `l --tree`                             |

## Setup Instructions

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

## Development

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

## Contributing

Feel free to fork this repository and adapt it to your needs. If you find any issues or have suggestions, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.