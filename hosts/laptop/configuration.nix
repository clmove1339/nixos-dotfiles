{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "laptop";
  
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
  programs.hyprland = {
          enable = true;
          xwayland.enable = true;
          withUWSM = true;
        };
services.displayManager.defaultSession = "hyprland-uwsm";
services.displayManager.autoLogin = {
enable = true;
user = "clmove";
};

  environment.systemPackages = with pkgs; [
  ];

  services.openssh.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
