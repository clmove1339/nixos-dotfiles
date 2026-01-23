{ config, pkgs, ... }:

{
  imports = [
    ./hyprland
    ./kitty
    ./waybar
    ./wofi
  ];

  home.username = "clmove";
  home.homeDirectory = "/home/clmove";
  home.stateVersion = "25.11";

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
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
    firefox
    vesktop
    telegram-desktop
    yandex-music

    noto-fonts
    font-awesome
    jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" "Noto Sans Mono CJK SC" "Noto Color Emoji" ];
      sansSerif = [ "JetBrainsMono Nerd Font" "Noto Sans CJK SC" "Noto Color Emoji" ];
      serif = [ "Noto Serif CJK SC" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";
      nix-sync = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles --fast";
      nix-clean = "sudo nix-collect-garbage -d";
    };
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.gh.enable = true;
}