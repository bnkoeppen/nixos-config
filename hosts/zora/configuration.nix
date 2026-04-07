{ inputs, pkgs, ... }:
{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  imports = [
    ../../nixosModules
    ../../nixosModules/zora

    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "zora";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-fortisslvpn
    ];
  };

  time.timeZone = "America/New_York";

  users.users.bnk = {
    isNormalUser = true;
    extraGroups = [
      "dialout" # Yubikey
      "wheel"
      "networkmanager"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.bnk = ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    openfortivpn
    omnissa-horizon-client
  ];

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
