{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  
  networking.networkmanager.enable = false;
  networking.wireless.enable = false;
  networking.wireless.iwd.enable = true;

  time.timeZone = "Europe/Moscow";

  users.users.clmove = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    kitty
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
