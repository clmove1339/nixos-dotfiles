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
