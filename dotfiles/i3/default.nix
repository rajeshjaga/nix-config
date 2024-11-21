{config, lib, pkgs, ...}:
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
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        modifier = "Mod4" ;
        fonts = {
          names = ["JetBrains Mono"];
          size = 16.0;
        };
        gaps = {
          #smartGaps = true;
          inner = 10;
          outer = 10;
          smartBorders = "on";
        };
        menu = "${config.programs.rofi.package}/bin/rofi -show drun";
        terminal = "wezterm";
        floating.criteria =[{ class = "Conky"; }{ class = "Pavucontrol"; }];
        startup = [
        { command = "dunst &"; always=true; notification=true; }
        { command = "flameshot &";  always=true; notification=false; }
        { command = "lxsession --session=i3 --de=i3 &"; always=true; notification=false; }
        { command = "dex --autostart --enviroment i3"; always=true; notification=false; }
        { command = "nwg-look -a"; always=true; notification=false; }
        ];
        window.titlebar = false;
        defaultWorkspace = "workspace number 1";
        keybindings =
          let
          mod = config.xsession.windowManager.i3.config.modifier;
        in
          lib.mkOptionDefault {
            ## bar toggle
            "${mod}+Shift+b" = "bar mode toggle";
            ## window focus keybinds
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+h" = "focus left";
            "${mod}+l" = "focus right";
            ## to move window keybinds
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+l" = "move right";
            ## to put i3 in resize mode
            "${mod}+r" = "mode resize";
            ## to kill active window
            "${mod}+Shift+c" = "kill";
            ## to kill i3wm
            "${mod}+Shift+q" = "exec --no-startup-id i3-msg exit";
            # layout keybinds
            "${mod}+e" = "split vertical";
            "${mod}+n" = "layout default";
            "${mod}+w" = "layout stacked";
            "${mod}+t" = "layout tabbed";
            "${mod}+f" = "fullscreen toggle";
            "${mod}+Shift+f" = "floating toggle";
            "${mod}+Shift+m" = "focus mode_toggle";
            "${mod}+Shift+w" = "layout toggle";
            "${mod}+Shift+e" = "split horizontal";
            # application keybinds
            "${mod}+v" = "exec --no-startup-id pavucontrol";
            "${mod}+b" = "exec --no-startup-id chromium";
            "${mod}+Return" = "exec --no-startup-id kitty";
            "${mod}+space" = "exec --no-startup-id rofi -show drun";
            "${mod}+Shift+space" = "exec --no-startup-id rofi -show window";
            "${mod}+Shift+d" = "exec --no-startup-id dmenu_run -fn 'FiraCode-14' -nb '#1e1e2e' -nf '#cdd6f4' -sf '#1e1e2e' -sb '#89decb'";
            "${mod}+g" = "exec --no-startup-id i3-msg gaps inner current toggle 10 && i3-msg gaps outer current toggle 10";
            # "Mod1+l" = "exec --no-startup-id i3-lock";
          };
        modes = {
            resize = {
              "j" = "resize grow height 10 px or 10 ppt";
              "k" = "resize shrink width 10 px or 10 ppt";
              "l" = "resize grow width 10 px or 10 ppt";
              "h" = "resize shrink height 10 px or 10 ppt";
              Escape = "mode default";
              Return = "mode default";
              Down = "resize grow height 10 px or 10 ppt";
              Up = "resize shrink width 10 px or 10 ppt";
              Right = "resize grow width 10 px or 10 ppt";
              Left = "resize shrink height 10 px or 10 ppt";
            };
        };
        colors = {
          focused = {
            text = colors.text;
            background = colors.base;
            border = colors.rose;
            childBorder = colors.rose;
            indicator = colors.rose;
          };
          focusedInactive = {
            text = colors.text;
            background = colors.base;
            border = colors.surface;
            childBorder = colors.surface;
            indicator = colors.subtle;
          };
          unfocused = {
            text = colors.text;
            background = colors.base;
            border = colors.overlay;
            childBorder = colors.overlay;
            indicator = colors.overlay;
          };
          placeholder =  {
            text = colors.base;
            background = colors.base;
            border = colors.overlay;
            childBorder = colors.overlay;
            indicator = colors.overlay;
          };
          urgent ={
            text = colors.text;
            background = colors.rose;
            border = colors.iris;
            childBorder = colors.overlay;
            indicator = colors.rose;
          };
          background =  colors.base;
        };
        window.border = 1;
        bars = [];
      };
      extraConfig = ''for_window [all] title_window_icon padding 10px'';
    };
  };
  services = {
    picom.enable = true;
    conky = {
      enable = true;
      extraConfig = ''
        background = true;
      '';
    };
  };
  imports = [ ./polybar.nix ];
}
