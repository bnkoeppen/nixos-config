{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    openjdk25
  ];
}
