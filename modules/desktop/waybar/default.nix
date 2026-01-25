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
          "tray"
          "network"
          "pulseaudio"
          "battery"
          "custom/power"
        ];

        "custom/power" = {
          format = "<span size='13pt' font='Material Symbols Outlined'>power_settings_new</span>";
          on-click = "wlogout --protocol layer-shell -b 2";
          tooltip = false;
        };

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
          format-icons = {
            wifi = [
              "<span size='13pt' font='Material Symbols Outlined'>network_wifi_1_bar</span>"
              "<span size='13pt' font='Material Symbols Outlined'>network_wifi_2_bar</span>"
              "<span size='13pt' font='Material Symbols Outlined'>network_wifi_3_bar</span>"
              "<span size='13pt' font='Material Symbols Outlined'>signal_wifi_4_bar</span>"
            ];
            ethernet = "<span size='13pt' font='Material Symbols Outlined'>lan</span>";
            disabled = "<span size='13pt' font='Material Symbols Outlined'>signal_wifi_off</span>";
            disconnected = "<span size='13pt' font='Material Symbols Outlined'>signal_wifi_bad</span>";
          };
          format-wifi = "{icon}";
          format-ethernet = "{icon}";
          format-disconnected = "{icon}";
          format-disabled = "{icon}";
          interval = 5;
          tooltip-format = "{essid}\t{gwaddr}";
          tooltip = true;
          max-length = 20;
        };

        "pulseaudio" = {
          interval = 2;
          format = "{icon}";
          format-muted = "<span size='14pt' font='Material Symbols Outlined'>volume_off</span>";
          format-icons = {
            headPhone = "<span size='14pt' font='Material Symbols Outlined'>headphones</span>";
            hands-free = "<span size='14pt' font='Material Symbols Outlined'>headset_mic</span>";
            headset = "<span size='14pt' font='Material Symbols Outlined'>headphones</span>";
            headset-muted = "<span size='14pt' font='Material Symbols Outlined'>headset_off</span>";
            default = [
              "<span size='14pt' font='Material Symbols Outlined'>volume_mute</span>"
              "<span size='14pt' font='Material Symbols Outlined'>volume_down</span>"
              "<span size='14pt' font='Material Symbols Outlined'>volume_up</span>"
            ];
          };
          on-click = "pavucontrol";
        };

        "tray" = {
          spacing = 10;
        };

        "battery" = {
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
            plugordie = 5;
          };
          format = "{icon}";
          format-icons = [
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_0</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_1</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_2</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_3</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_4</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_5</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_6</span>"
            "<span size='15pt' font='Material Symbols Outlined'>battery_android_full</span>"
          ];
          format-charging = "<span size='15pt' font='Material Symbols Outlined'>battery_android_bolt</span>";
          format-plugged = "<span size='15pt' font='Material Symbols Outlined'>bolt</span>";
          format-plugordie = "<span size='15pt' font='Material Symbols Outlined'>battery_android_alert</span>";
          tooltip = true;
          tooltip-format = "Charge: {capacity}%";
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
