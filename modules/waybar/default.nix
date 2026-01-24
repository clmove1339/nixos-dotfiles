{ config, pkgs, ... }:

{
  services.playerctld.enable = true;

  programs.waybar = {
    enable = true;
    systemd.enable = false;

    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 10;
        height = 36;
        spacing = 5;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
           # "mpris"
          "network"
          "pulseaudio"
          "battery"
          "tray"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "clock" = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
        };

        "network" = {
          format-wifi = "{essid}";
          format-ethernet = "{ipaddr}/{cidr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          spacing = 10;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}%";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time}";
        };

        "mpris" = {
          format = "{status_icon} {title}";

          status-icons = {
            playing = "󰝚";
            paused = "<span color='#b4befe'>󰏤</span>";
            stopped = "<span color='#f38ba8'>󰓛</span>";
          };

          tooltip-format = "{title} • {artist}";

          interval = 1;
        };
      };
    };
  };
}
