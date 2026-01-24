{
  programs.rofi = {
    enable = true;

    theme = {
      "@theme" = "${./style.rasi}";
    };

    plugins = [ pkgs.rofi-calc ];
    extraConfig = {
      modi = "drun,ssh,run";
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-ssh = " 󰌘 Ssh ";
      drun-display-format = "{icon} {name}";
      show-icons = true;
      sidebar-mode = true;
      terminal = "ghostty";
    };
  };
}
