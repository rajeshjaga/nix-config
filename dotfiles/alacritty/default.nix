{pkgs,...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import =  [ ./rose-pine.toml ];
      cursor = {
        blink_interval = 250;
        style = {
          shape = "Beam";
          blinking = "Always";
        };
      };
      font = {
        normal = {
        family = "JetBrains Mono Nerd Font";
        style = "Medium";
        };
      };
      window = {
        opacity = 0.85;
        dynamic_padding = true;
        blur = true;
      };
    };
  };
}
