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
      logo = {
        source = "nixos_small";
        padding = { right = 1; };
      };
      display = {
        separator = "  ";
        color = "cyan";
      };
      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = "distro";
          keyColor = "cyan";
        }
        {
          type = "kernel";
          key = "kernel";
          keyColor = "cyan";
        }
        {
          type = "uptime";
          key = "uptime";
          keyColor = "cyan";
        }
        {
          type = "packages";
          key = "pkgs";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "shell";
          keyColor = "cyan";
        }
        {
          type = "memory";
          key = "memory";
          keyColor = "cyan";
        }
      ];
    };
  };
}
