{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    base16-schemes
  ];
}
