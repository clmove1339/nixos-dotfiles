{ lib, ... }:
let
  modifier = "SUPER";
  terminal = "ghostty";
  menu = "rofi -show drun";

  directions = {
    "left" = "l";
    "right" = "r";
    "up" = "u";
    "down" = "d";
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = modifier;

      exec-once = [ "waybar" ];

      monitor = [ "eDP-1,1920x1200,auto,1" ];

      general = {
        gaps_out = 10;
        gaps_in = 5;
        border_size = 2;
        "col.active_border" = "rgba(8ec028ff)";
        "col.inactive_border" = "rgba(595959ff)";
      };

      decoration = {
        rounding = 0;
        shadow.enabled = false;
        blur.enabled = false;
      };

      animations.enabled = false;

      cursor.no_hardware_cursors = false;

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;
      };

      bind = lib.flatten [
        "$mod, RETURN, exec, ${terminal}"
        "$mod, SPACE, exec, ${menu}"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, V, togglefloating,"
        "$mod, F, fullscreen,"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        "$mod CTRL, left, workspace, -1"
        "$mod CTRL, right, workspace, +1"

        # Generate Workspace Bindings (Key 1-9 -> WS 1-9, Key 0 -> WS 10)
        (map
          (
            n:
            let
              key = toString n;
              ws = if n == 0 then "10" else key;
            in
            [
              "$mod, ${key}, workspace, ${ws}"
              "$mod SHIFT, ${key}, movetoworkspace, ${ws}"
            ]
          )
          [
            1
            2
            3
            4
            5
            6
            7
            8
            9
            0
          ]
        )

        # Directional Bindings (Focus, Move, Resize)
        (lib.mapAttrsToList (key: dir: [
          "$mod, ${key}, movefocus, ${dir}"
          "$mod SHIFT, ${key}, movewindow, ${dir}"
          "$mod ALT, ${key}, resizeactive, ${
            if dir == "l" then
              "-20 0"
            else if dir == "r" then
              "20 0"
            else if dir == "u" then
              "0 -20"
            else
              "0 20"
          }"
        ]) directions)
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "float, class:feh"
        "move 77% 4%, class:feh"
      ];
    };
  };
}
