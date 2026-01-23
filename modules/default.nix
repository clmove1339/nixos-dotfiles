{ config, pkgs, ... }:

{
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
    net-tools
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ff = "fastfetch";

      nix-sync = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";
      nix-clean = "sudo nix-collect-garbage -d";
    };
  };

  programs.fastfetch = {
    enable = true;
  };

  programs.gh.enable = true;

  programs.wofi.enable = true;
  programs.waybar.enable = true;
  programs.waybar.systemd.enable = true;
}
