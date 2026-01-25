{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "power_settings_new";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "refresh";
        keybind = "r";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "exit_to_app";
        keybind = "l";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "bedtime";
        keybind = "u";
      }
      {
        label = "cancel";
        action = "wlogout -c";
        text = "close";
        keybind = "c";
      }
    ];

    style = ''
      @define-color bg #1e1e1e;
      @define-color fg #ffffff;
      @define-color accent #8ec028;
      @define-color border-color #595959;

      window {
          background-color: rgba(30, 30, 30, 0.9);
          font-family: "Material Symbols Outlined";
          font-size: 14px;
      }

      button {
          color: @fg;
          background-color: @bg;
          border: 2px solid @border-color;
          border-radius: 0px;
          margin: 15px;
          padding: 40px 40px 40px 40px;
          font-size: 64px;
          font-weight: bold;  /* Making the text bold */
          /* Removed transition to eliminate animations */
          transition: none;
          /* Center the icon using margins */
          min-width: 140px;
          min-height: 140px;
      }

      button:hover {
          background-color: #262626;
          border: 2px solid @accent;
          /* Removed transition to eliminate animations */
          transition: none;
      }

      #shutdown {
          color: #f53c3c; /* Red icon */
          background-color: #2c2c2c;
          border: 2px solid #595959;
      }
      #shutdown:focus {
          border: 2px solid @accent;  /* 2px border on focus */
      }

      #reboot {
          color: #3498db; /* Blue icon */
          background-color: #2c2c2c;
          border: 2px solid #595959;
      }
      #reboot:focus {
          border: 2px solid @accent;  /* 2px border on focus */
      }

      #logout {
          color: #9b59b6; /* Purple icon */
          background-color: #2c2c2c;
          border: 2px solid #595959;
      }
      #logout:focus {
          border: 2px solid @accent;  /* 2px border on focus */
      }

      #suspend {
          color: #f39c12; /* Orange icon */
          background-color: #2c2c2c;
          border: 2px solid #595959;
      }
      #suspend:focus {
          border: 2px solid @accent;  /* 2px border on focus */
      }

      #cancel {
          color: #7f8c8d; /* Gray icon */
          background-color: #2c2c2c;
          border: 2px solid #595959;
      }
      #cancel:focus {
          border: 2px solid @accent;  /* 2px border on focus */
      }
    '';
  };
}
