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
}
