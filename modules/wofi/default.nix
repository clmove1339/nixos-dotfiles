{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;

    style = ./style.css;

    settings = {
      width = 400;
      height = 300;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_type = "application/x-executable";
      insensitive = true;
    };
  };
}
