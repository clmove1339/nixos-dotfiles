{ config, pkgs, ... }:

let
  file = builtins.readFile ./style.css;

  style =
    builtins.replaceStrings
      [ "./icons" ]
      [ "${./assets}" ]
      file;
in
{
  programs.wlogout = {
    enable = true;

    style = style;

    layout = [
      {
        label = "signout";
        action = "loginctl terminate-user $USER";
        text = "Sign out";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
      }
      {
        label = "poweroff";
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
