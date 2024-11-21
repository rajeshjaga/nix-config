{config, pkgs, ...}:
{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "papirus-icon-theme";
      package = pkgs.papirus-icon-theme;
      size = 32x32;
  };
}
