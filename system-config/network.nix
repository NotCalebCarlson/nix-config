{config, pkgs, ... }:
{
  networking.hostName = "nixos";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  powerManagement.resumeCommands = ''
    ${pkgs.systemd}/bin/systemctl restart NetworkManager
  '';
}
