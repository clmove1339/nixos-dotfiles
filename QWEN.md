# NixOS Dotfiles Project Overview

## Project Description

This is a personal NixOS configuration repository for user "clmove", focusing on a Wayland desktop environment using Hyprland as the window manager. The configuration is managed using Nix Flakes with Home Manager to provide a declarative system and user environment configuration.

## Architecture and Structure

The project follows a typical NixOS flake structure:

- **flake.nix**: Main entry point that defines inputs (NixOS, Home Manager) and system configurations
- **hosts/**: Contains host-specific configurations (currently just "laptop")
- **modules/**: Shared Home Manager modules organized by category (apps, desktop, system)

## Key Technologies and Components

- **Base OS**: NixOS (stable 25.11 branch)
- **Window Manager**: Hyprland (Wayland compositor)
- **Display Server**: Wayland with XWayland support
- **Terminal**: Ghostty
- **Application Launcher**: Rofi
- **Status Bar**: Waybar
- **Shell**: Zsh with custom configurations
- **Theming**: Dark theme with custom colors

## System Configuration

Located in `hosts/laptop/configuration.nix`, the system configuration includes:
- Boot settings (systemd-boot, kernel parameters)
- Network configuration (NetworkManager with iwd for WiFi)
- User account setup (clmove with appropriate groups)
- SSH service enabled
- Experimental Nix features enabled (flakes, nix-command)
- Greetd login manager with tuigreet

## Desktop Environment Configuration

The Hyprland configuration includes:
- Custom keybindings (Super+Enter for terminal, Super+Space for app launcher, etc.)
- Workspace management with cycling functionality
- Window decorations and animations
- Input settings (keyboard layout switching US/RU)
- Monitor configuration

## Package Management

The configuration manages both system and user packages:
- System packages defined in `hosts/laptop/configuration.nix`
- User packages in `modules/default.nix` including Firefox, Discord client (vestop), Telegram, Yandex Music, fonts, and development tools
- Common shell aliases for productivity (nix-switch, nix-test, nix-clean)

## Key Features

### Keybindings (Hyprland)
- `$mod + Enter`: Open terminal
- `$mod + Space`: Open app launcher (Rofi)
- `$mod + Q`: Close active window
- `$mod + F`: Toggle fullscreen
- `$mod + V`: Toggle floating
- `$mod + Arrow Keys`: Move focus
- `$mod + Shift + Arrow Keys`: Move window
- `$mod + Ctrl + Left/Right`: Cycle through workspaces
- `$mod + [0-9]`: Switch to workspace
- `$mod + Shift + [0-9]`: Move window to workspace

### Shell Aliases
- `nix-switch`: Switch to the current flake configuration
- `nix-test`: Test the current flake configuration without applying
- `nix-clean`: Clean Nix garbage collection
- Navigation and utility aliases (`l`, `ll`, `la`, `lt`, etc.)

## Building and Running

### Prerequisites
- Nix with flakes and experimental features enabled:
  ```bash
  export NIX_CONFIG="experimental-features = nix-command flakes"
  ```

### Deployment
1. Clone the repository
2. Apply the configuration:
   ```bash
   sudo nixos-rebuild switch --flake .
   # Or use the alias: nix-switch
   ```

### Testing Changes
Test changes without affecting the system:
```bash
sudo nixos-rebuild test --flake .
```

### Updating
Update the flake lock file:
```bash
nix flake update
```

## Development Conventions

- Declarative configuration using Nix
- Modular structure with separate files for different components
- Consistent naming conventions for configurations
- Focus on Wayland-native applications where possible
- Well-documented keybindings and settings

## Formatting

The repository includes a `nix-format` script to format all `.nix` files:
```bash
# Format all .nix files in the current directory
nix-format

# Format all .nix files in a specific directory
nix-format /path/to/directory
```

## License

This project is licensed under the MIT License (see LICENSE file for details).