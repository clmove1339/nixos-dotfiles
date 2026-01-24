{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [ "waybar" ];

      monitor = [
        "eDP-1,1920x1200,auto,1"
      ];

      general = {
        gaps_out = 10;
        gaps_in = 5;
        border_size = 2;
        "col.active_border" = "rgba(8ec028ff)";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 0;

        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = false;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      misc = {
        force_default_wallpaper = 2;
        disable_hyprland_logo = false;
        disable_splash_rendering = true;
      };

      input = {
        kb_layout = "us,ru";
        kb_variant = ",";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;
      };

      # Key bindings
      bind =
        let
          # Workspace bindings
          workspaceBindings = builtins.concatLists (
            map (
              n:
              let
                workspace = if n == 0 then 10 else n;
              in
              [
                "SUPER, ${toString n}, workspace, ${toString workspace}"
                "SUPER SHIFT, ${toString n}, movetoworkspace, ${toString workspace}"
              ]
            ) (builtins.genList (n: n) 10)
          );

          # Application launchers
          appBindings = [
            "SUPER, RETURN, exec, ghostty"
            "SUPER, SPACE, exec, wofi --show drun"
            "SUPER, W, exec, firefox"
          ];

          # Window management
          windowBindings = [
            "SUPER, C, killactive,"
            "SUPER, M, exit,"
            "SUPER, V, togglefloating,"
            "SUPER, F, fullscreen,"
          ];

          # Focus navigation
          focusBindings = [
            "SUPER, left, movefocus, l"
            "SUPER, right, movefocus, r"
            "SUPER, up, movefocus, u"
            "SUPER, down, movefocus, d"
            "SUPER, h, movefocus, l"
            "SUPER, l, movefocus, r"
            "SUPER, k, movefocus, u"
            "SUPER, j, movefocus, d"
          ];

          # Workspace navigation
          workspaceNavBindings = [
            "SUPER, mouse_down, workspace, e+1"
            "SUPER, mouse_up, workspace, e-1"
            "SUPER CTRL, left, workspace, -1"
            "SUPER CTRL, right, workspace, +1"
            "SUPER ALT, left, workspace, -1"
            "SUPER ALT, right, workspace, +1"
          ];

          # Window movement
          moveBindings = [
            "SUPER SHIFT, left, movewindow, l"
            "SUPER SHIFT, right, movewindow, r"
            "SUPER SHIFT, up, movewindow, u"
            "SUPER SHIFT, down, movewindow, d"
            "SUPER SHIFT, h, movewindow, l"
            "SUPER SHIFT, l, movewindow, r"
            "SUPER SHIFT, k, movewindow, u"
            "SUPER SHIFT, j, movewindow, d"
          ];

          # Window resizing
          resizeBindings = [
            "SUPER CTRL, left, resizeactive, -20 0"
            "SUPER CTRL, right, resizeactive, 20 0"
            "SUPER CTRL, up, resizeactive, 0 -20"
            "SUPER CTRL, down, resizeactive, 0 20"
            "SUPER CTRL, h, resizeactive, -20 0"
            "SUPER CTRL, l, resizeactive, 20 0"
            "SUPER CTRL, k, resizeactive, 0 -20"
            "SUPER CTRL, j, resizeactive, 0 20"
          ];
        in
        workspaceBindings
        ++ appBindings
        ++ windowBindings
        ++ focusBindings
        ++ workspaceNavBindings
        ++ moveBindings
        ++ resizeBindings;

      # Mouse bindings
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      # Window rules
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "float, class:feh"
        "move 77% 4%, class:feh"
      ];
    };
  };
}
