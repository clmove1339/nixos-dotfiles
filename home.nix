{ config, pkgs, ... }:

{
  home.username = "clmove";
  home.homeDirectory = "/home/clmove";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nix-sync = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " 󰑃  ";
      };
      logo = {
        source = "Linux";
        type = "builtin";
        padding = {
          top = 6;
          left = 2;
        };
      };
      modules = [
        "break"
        {
          type = "title";
          color = {
            user = "35";
            host = "36";
          };
        }
        {
          type = "separator";
          string = "▔";
        }
        {
          type = "os";
          key = " Distro";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = "  ├─";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "  ├─󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "  └─";
          keyColor = "yellow";
        }
        "break"
        {
          type = "wm";
          key = " DE/WM";
          keyColor = "blue";
        }
        {
          type = "theme";
          key = "  ├─󰉼";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "  ├─󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "  ├─󰉋";
          keyColor = "blue";
        }
        {
          type = "cursor";
          key = "  ├─󰳽";
          keyColor = "blue";
        }
        {
          type = "font";
          key = "  ├─";
          format = "{2}";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = "  └─";
          keyColor = "blue";
        }
        "break"
        {
          type = "host";
          key = "󰌢 System";
          keyColor = "green";
        }
        {
          type = "board";
          key = "󰌢 System";
          keyColor = "green";
          condition = {
            succeeded = false;
          };
        }
        {
          type = "display";
          key = "  ├─󰹑";
          keyColor = "green";
          compactType = "original-with-refresh-rate";
        }
        {
          type = "cpu";
          key = "  ├─";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "  ├─";
          format = "{2}";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "  ├─󰘚";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "  ├─󰋊";
          folders = "/";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "  └─󰔚";
          keyColor = "green";
        }
        "break"
        {
          type = "colors";
          symbol = "background";
          paddingLeft = 9;
        }
        "break"
      ];
    };
  };
}
