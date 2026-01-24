{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./nix-format.nix

    ./ghostty

    ./hyprland
    ./waybar

    ./rofi
  ];

  services.mako = {
    enable = true;

    settings = {
      font = "JetBrains Mono 12";
      width = 300;
      height = 150;
      margin = "10";
      padding = "5";
      border-size = 2;
      border-radius = 0;

      background-color = "#1e1e1e";
      text-color = "#ffffff";
      border-color = "#595959";
      progress-color = "over #6a901e";

      default-timeout = 15000;
      layer = "overlay";
      anchor = "top-right";
    };
  };

  home.username = "clmove";
  home.homeDirectory = "/home/clmove";
  home.stateVersion = "25.11";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  home.packages = with pkgs; [
    libnotify

    firefox
    vesktop
    telegram-desktop

    noto-fonts
    font-awesome
    jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
  ];

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      hostname = {
        format = "[$ssh_symbol$hostname]($style) ";
        ssh_only = false;
        style = "bold purple";
      };

      username = {
        format = "[$user]($style)@";
        show_always = true;
        style_user = "bold yellow";
      };

      character = {
        error_symbol = "[ & ](bold red)";
        success_symbol = "[ & ](bold green)";
      };

      battery = {
        disabled = true;
      };
    };
  };

  programs.git = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ff = "fastfetch";

      l = "${pkgs.eza}/bin/eza --icons --group-directories-first --git";
      ls = "l";
      ll = "l -lh";
      la = "l -a";
      lt = "l --tree";

      mkdir = "mkdir -pv";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      cat = "${pkgs.bat}/bin/bat --style=plain --paging=never";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      wget = "wget -c";

      ".." = "cd ..";
      "~" = "cd ~";

      nix-switch = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";
      nix-test = "sudo nixos-rebuild test --flake ~/nixos-dotfiles";
      nix-clean = "sudo nix-collect-garbage -d && nix-store --optimize";
    };
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.gh.enable = true;
}
