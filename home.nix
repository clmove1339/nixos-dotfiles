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
          key = "OS";
          keyColor = "cyan";
        }
        {
          type = "kernel";
          key = "Ker";
          keyColor = "cyan";
        }
        {
          type = "uptime";
          key = "Up";
          keyColor = "cyan";
        }
        {
          type = "packages";
          key = "Pkg";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "Sh";
          keyColor = "cyan";
        }
        {
          type = "memory";
          key = "Mem";
          keyColor = "cyan";
        }
      ];
    };
  };
}
