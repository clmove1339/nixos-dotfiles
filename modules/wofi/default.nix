{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 24;
      gtk_dark = true;
    };
    style = ''
      window {
        margin: 0px;
        border: 2px solid #8ec028;
        background-color: #1e1e1e;
        border-radius: 0px;
      }

      #input {
        margin: 5px;
        border: none;
        color: #ffffff;
        background-color: #323232;
        border-radius: 0px;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #1e1e1e;
        border-radius: 0px;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #1e1e1e;
        border-radius: 0px;
      }

      #scroll {
        margin: 0px;
        border: none;
        border-radius: 0px;
      }

      #text {
        margin: 5px;
        border: none;
        color: #ffffff;
      }

      #entry:selected {
        background-color: #8ec028;
        border-radius: 0px;
      }
    '';
  };
}
