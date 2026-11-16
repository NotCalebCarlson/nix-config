{config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./system-config/audio.nix
      ./system-config/bluetooth.nix
      ./system-config/boot.nix
      ./system-config/network.nix
      ./system-config/printing.nix
      ./system-config/system-ui.nix
      ./system-config/time.nix
      ./system-config/users.nix
      ./system-config/virtualization.nix
    ];

  # This does not effect the version of nix os installed...
  # This is a variable used for bakwards compatibility purposes.
  # DO NOT CHANGE THIS.
  system.stateVersion = "26.05";

}
