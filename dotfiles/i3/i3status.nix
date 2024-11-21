{...}:
let 
colors =  {
  base = "#191724";
  overlay = "#26233a";
  surface = "#1f1d2e";
  subtle = "#908caa";
  text = "#e0def4";
  gold = "#f6c177";
  iris = "#c4a7e7";
  pine = "#31748f";
  love = "#eb6f92";
  rose = "#ebbcba";
  muted = "#6e6a86";
};
in {
  xsession.windowManager.i3.config.bars = [
  {
    position = "top";
    statusCommand = "i3status";
    trayPadding = 4;
    fonts = {
      names = [ "JetBrains Mono Nerd Font" ];
      size = 14.0;
    };
    colors = {
      background = "${colors.base}";
      statusline = "${colors.base}";
      separator = "${colors.base}";
      focusedStatusline = "${colors.text}";
      focusedWorkspace = {
        background = colors.pine;
        border = colors.pine;
        text = colors.base;
      };
      activeWorkspace = {
        background = colors.pine;
        border = colors.pine;
        text = colors.base;
      };
      inactiveWorkspace = {
        background = colors.overlay;
        border = colors.overlay;
        text = colors.muted;
      };
      urgentWorkspace = {
        background = colors.love;
        border = colors.love;
        text = colors.gold;
      };
      bindingMode = {
        background = colors.gold;
        border = colors.rose;
        text = colors.overlay;
      };
    };
    extraConfig = ''

      
            general {
              output_format="i3bar"
                colors = true
                interval = 5
                color_good="#cdd6f4"
            }
      order += "battery all"
      order += "volume master"
      order += "memory"
      order += "tztime local"


      battery all {
        format = "Bat: %percentage %status %remaining (%emptytime %consumption)"
      }
    volume master {
      format = "Vol: %volume"
        format_muted = "Vol: Muted (%volume)"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
    }

    memory {
      format = "Ram: %used"
        threshold_degraded = "1G"
        format_degraded = "MEMORY < %available"
    }
    tztime local {
      format = "Time: %H:%M"
    }
    '';
  }
  ];
}
