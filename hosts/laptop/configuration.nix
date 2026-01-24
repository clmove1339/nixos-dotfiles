{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];
  programs.dconf.enable = true;
  documentation.nixos.enable = false;

  boot.kernelParams = [
    "quiet"
    "tsc=reliable"
    "i8042.nopnp"
  ];
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 3;

  security.rtkit.enable = true;

  boot.loader.timeout = 3;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "laptop";
  networking.wireless.enable = false;
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  time.timeZone = "Europe/Moscow";

  users.users.clmove = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "hyprland"
        "gtk"
      ];
    };
  };
  programs.zsh.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --asterisks \
            --window-padding 2 \
            --container-padding 2 \
            --cmd Hyprland
        '';
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  environment.systemPackages = with pkgs; [ ];

  services.openssh.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
