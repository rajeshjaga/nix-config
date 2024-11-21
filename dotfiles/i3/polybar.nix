{pkgs,...}:
let
colors = {
  # base
  background = "#191724";
  # highlight-med
  background-alt = "#21202e";
  # Text
  foreground = "#e0def4";
  # rose
  primary = "#ebbcba";
  # gold
  secondary = "#f6c177";
  # love
  alert = "#eb6f92";
  # muted
  disabled = "#6e6a86";
};
in {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      #  i3GapsSupport = true;
      alsaSupport = true;
      pulseSupport = true;
      iwSupport = true;
      #githubSupport = true;
    };
    script = "pkill polybar; polybar --reload main &";
    config = {
      "global/wm" = {
          margin-top = 0;
          margin-bottom = 0;
      };
      "bar/main" = {
        monitor = "Virtual-1";
        width = "100%";
        height = "36";
        radius = 0;
        border-size = 1;
        line-size = 2;
        padding = 0;
        module-margin = 1;
        enable-ipc = true;
        cursor-click = "pointer";
        curosr-scroll = "ns-resize";
        line-color = "${colors.background-alt}";
        foreground = "${colors.foreground}";
        background = "${colors.background}e1";
        border-color = "${colors.secondary}";
        modules-right = "network wlan mem bat date systray";
        modules-left = "oslogo xwindow";
        modules-center = "xworkspaces";
        font-0 = "JetBrainsMono Nerd Font:style=Regular:size=12;1";
      };
      "module/oslogo" = {
        type = "custom/text";
        content = "  Nixos";
        content-background = "#31748f";
        content-foreground = "${colors.foreground}";
        content-padding = 1;
      };
      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:25:...%";
        format = "<label>";
        format-prefix = "  ";
        format-prefix-foreground = "${colors.foreground}";
        label-empty = "NixOS";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        format = "<label-state>";
        label-active = "%name%";
        label-active-forground = "${colors.primary}";
        label-active-background = "${colors.background}";
        label-active-padding = 1;
        label-occupied-padding = 1;
        format-padding = 0;
      };
      "module/wlan" = {
        type = "internal/network";
        interface-type = "wireless";
        label-connected = "  %essid% ";
        label-disconnected =  "󰖪 ";
      };
      "module/network" = {
        type = "internal/network";
          interface-type = "wired";
          label-connected = "%local_ip%";
          format-connected = "󱘖  <label-connected>";
          format-disconnected = "󰌙  ";
          label-disconnected = "";
      };
      "module/mem" = {
        type = "internal/memory";
        interval = 2;
        label = "%gb_used%/%gb_free%";
        format-prefix =   "  ";
      };
      "module/bat" = {
        type = "internal/battery";
        full-at = 99;
        low-at = 20;
        # ls -1 /sys/class/power_supply
        battery = "BAT0";
        adapter = "AC";
        poll-interval = 5;
        label-charging = "󰚥  %percentage%%";
        label-discharging = "  %percentage%%";
      };
      "module/systray" = {
        type = "internal/tray";
        tray-spacing = 2;
        tray-padding = 1;
        tray-size = 24;
        tray-background = "${colors.background}e1";
      };
      "module/date" = {
        type = "internal/date";
        internal = 1;
        date = "%d.%m.%y | %H:%M";
        label = "%date%";
        format-prefix = "  ";
        format = "<label>";
        format-foreground-color = "${colors.foreground}";
        format-background-color = "${colors.background}";
        format-padding = 1;
      };
      "settings" = {
        screechange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}
