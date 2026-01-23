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

  home.packages = with pkgs; [
    telegram-desktop
  ];

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
