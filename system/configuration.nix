{
  pkgs,
  ...
}:

{
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./overlays.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zora"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "America/New_York";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.libinput.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.tlp.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  services.mullvad-vpn.enable = true;

  users.users.bnk = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs.nix-ld.enable = true;
  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  programs.steam.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    playerctl # Required for hyprland audio
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "25.11"; # Did you read the comment?

}
