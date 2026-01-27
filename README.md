clmove's nixos dotfiles

a personal nixos setup with a focus on a wayland desktop environment using hyprland.

overview

this configuration provides a sleek and efficient desktop environment featuring:

- desktop environment: `hyprland` (wayland compositor)
- terminal: `ghostty`
- application launcher: `rofi`
- status bar: `waybar`
- shell: `zsh` with custom configurations
- window manager: `hyprland` with custom keybindings
- theming: dark theme with custom colors

structure

```
nixos-dotfiles/
├── flake.nix              # main entry point and configuration
├── flake.lock             # locked dependencies
├── hosts/                 # host-specific configurations
│   └── laptop/            # laptop configuration
│       ├── configuration.nix
│       └── hardware-configuration.nix
└── modules/               # shared home manager modules
    ├── default.nix       # main home configuration
    ├── nix-format.nix    # formatting script
    ├── apps/             # application configurations
    │   ├── ghostty/      # terminal configuration
    │   └── rofi/         # application launcher
    └── desktop/          # desktop environment configs
        ├── hyprland/     # window manager configuration
        ├── hyprpaper/    # wallpaper daemon
        ├── waybar/       # status bar
        └── wlogout/      # logout dialog
```

keybindings (hyprland)

| binding                   | action                              |
|---------------------------|-------------------------------------|
| <kbd>$mod + enter</kbd>       | open terminal                       |
| <kbd>$mod + space</kbd>       | open app launcher (rofi)            |
| <kbd>$mod + q</kbd>           | close active window                 |
| <kbd>$mod + f</kbd>           | toggle fullscreen                   |
| <kbd>$mod + v</kbd>           | toggle floating                     |
| <kbd>$mod + arrow keys</kbd>  | move focus                          |
| <kbd>$mod + shift + arrow keys</kbd> | move window                  |
| <kbd>$mod + ctrl + left/right</kbd> | cycle through workspaces      |
| <kbd>$mod + [0-9]</kbd>       | switch to workspace                 |
| <kbd>$mod + shift + [0-9]</kbd> | move window to workspace          |

shell aliases

| alias        | command                                |
|--------------|----------------------------------------|
| `nix-switch` | `sudo nixos-rebuild switch --flake .`  |
| `nix-test`   | `sudo nixos-rebuild test --flake .`    |
| `nix-clean`  | `sudo nix-collect-garbage -d && nix-store --optimize` |
| `l`          | `eza --icons --group-directories-first --git` |
| `ll`         | `l -lh`                                |
| `la`         | `l -a`                                 |
| `lt`         | `l --tree`                             |

setup instructions

prerequisites

make sure you have nix installed with flakes and experimental features enabled:

```bash
# enable flakes and nix-command if not already enabled
export nix_config="experimental-features = nix-command flakes"
```

deployment

1. clone this repository to your desired location (e.g., `~/nixos-dotfiles`)

2. from inside the cloned repository, switch to the configuration:
   ```bash
   sudo nixos-rebuild switch --flake .
   ```

3. or use the alias from the configuration:
   ```bash
   nix-switch
   ```

updating

to update the flake lock file and get the latest versions of inputs:
```bash
nix flake update
```

development

formatting

the configuration includes a `nix-format` script to format all `.nix` files:

```bash
# format all .nix files in the current directory
nix-format

# format all .nix files in a specific directory
nix-format /path/to/directory
```

testing changes

before applying changes system-wide, you can test them:
```bash
sudo nixos-rebuild test --flake .
```

this creates a temporary environment with your changes applied, allowing you to test before committing to the system configuration.

contributing

feel free to fork this repository and adapt it to your needs. if you find any issues or have suggestions, please open an issue or submit a pull request.