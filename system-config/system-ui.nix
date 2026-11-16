{config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
