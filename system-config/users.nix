{config, pkgs, ... }:
{
  users.users."caleb" = {
    isNormalUser = true;
    description = "Caleb Carlson";
    extraGroups = [ "networkmanager" "wheel" "dialout" "tty" "shared" "libvirtd"];
  };
}
