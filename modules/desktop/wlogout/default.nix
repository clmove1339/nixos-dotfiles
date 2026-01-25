{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;

    style = ./style.css;

    layout = [
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Sign out";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Power off";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Restart";
      }
    ];
  };
}
