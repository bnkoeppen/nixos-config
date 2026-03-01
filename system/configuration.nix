{ inputs, ... }:
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
    ./programs
    ./services

    ./hardware-configuration.nix
    ./fonts.nix
    ./overlays.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;

  networking.hostName = "zora";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  users.users.bnk = {
    isNormalUser = true;
    extraGroups = [
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
    users.bnk = ./home/home.nix;
  };

  system.stateVersion = "25.11"; # Did you read the comment?

}
