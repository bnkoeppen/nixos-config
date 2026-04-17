{ pkgs, ... }:
{
  services.udev.packages = with pkgs; [
    yubikey-personalization
    libu2f-host
  ];

  environment.systemPackages = with pkgs; [
    yubico-pam
    yubioath-flutter
  ];

  services.pcscd.enable = true;
  programs.gnupg.agent.enable = true;
}
