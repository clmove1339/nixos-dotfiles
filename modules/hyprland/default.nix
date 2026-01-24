{ pkgs, lib, ... }:

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

  cycle-workspace = pkgs.writeShellApplication {
    name = "cycle-workspace";
    runtimeInputs = [
      pkgs.jq
      pkgs.hyprland
    ];
    text = ''
      # Get the current workspace ID
      current=$(hyprctl activeworkspace -j | jq '.id')

      # Calculate next workspace (1-10)
      if [ "$1" = "next" ]; then
          # (current % 10) + 1
          # 1->2, 9->10, 10->1
          next=$(( (current % 10) + 1 ))
      else
          # ((current - 2 + 10) % 10) + 1
          # 1->10, 2->1, 10->9
          next=$(( (current - 2 + 10) % 10 + 1 ))
      fi

      hyprctl dispatch workspace "$next"
    '';
  };

  cycle_ws = pkgs.writeShellScript "cycle_ws" ''
    ID=$(hyprctl activeworkspace -j | jq '.id')
    if [ "$1" = "+1" ]; then
      NEXT=$(( (ID % 10) + 1 ))
    else
      NEXT=$(( (ID - 2 + 10) % 10 + 1 ))
    fi
    hyprctl dispatch workspace $NEXT
  '';
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

      # Resize Repeat Fix
      binde = lib.flatten [
        (lib.mapAttrsToList (
          key: dir:
          let
            res =
              if dir == "l" then
                "-20 0"
              else if dir == "r" then
                "20 0"
              else if dir == "u" then
                "0 -20"
              else
                "0 20";
          in
          "$mod ALT, ${key}, resizeactive, ${res}"
        ) directions)
      ];

      bind = lib.flatten [
        "$mod, RETURN, exec, ${terminal}"
        "$mod, SPACE, exec, ${menu}"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, V, togglefloating,"
        "$mod, F, fullscreen,"

        "$mod CTRL, Right, exec, cycle-workspace next"
        "$mod CTRL, Left, exec, cycle-workspace prev"

        #"$mod CTRL, right, exec, ${cycle_ws} +1"
        # "$mod CTRL, left, exec, ${cycle_ws} -1"

        # Generate Workspace Bindings
        (map (
          n:
          let
            key = toString n;
            ws = if n == 0 then "10" else key;
          in
          [
            "$mod, ${key}, workspace, ${ws}"
            "$mod SHIFT, ${key}, movetoworkspace, ${ws}"
          ]
        ) (builtins.genList (n: n) 10))

        # Directional Bindings (Focus, Move)
        (lib.mapAttrsToList (key: dir: [
          "$mod, ${key}, movefocus, ${dir}"
          "$mod SHIFT, ${key}, movewindow, ${dir}"
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
