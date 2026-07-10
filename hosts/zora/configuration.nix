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
  boot.kernelPackages = pkgs.linuxPackages_latest;

  security.pam.services.swaylock = { };
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "zora";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-fortisslvpn
    ];
  };
  networking.nameservers = [
    "1.1.1.1"
  ];
  networking.search = [
    "taile9045b.ts.net"
  ];

  time.timeZone = "America/New_York";

  users.users.bnk = {
    isNormalUser = true;
    extraGroups = [
      "dialout" # Yubikey
      "wheel"
      "networkmanager"
    ];
  };

  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
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
    git
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system.stateVersion = "25.05"; # Did you read the comment?

}
