{
  services.hyprpaper = {
    enable = true;

    settings = {
      ipc = "on";
      splash = false;

      #preload = [ "~/nixos-dotfiles/modules/hyprpaper/wallpaper.png" ];
      #wallpaper = [ ",~/nixos-dotfiles/modules/hyprpaper/wallpaper.png" ];
    };
  };
}
