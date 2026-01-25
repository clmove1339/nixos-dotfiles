{
  programs.rofi = {
    enable = true;

    theme = {
      "@theme" = "${./style.rasi}";
    };

    extraConfig = {
      drun-display-format = "{icon} {name}";
      show-icons = true;
      terminal = "ghostty";
      sidebar-mode = false;
      display-drun = "🔍 Apps";
      placeholder = "Search...";
    };
  };
}
