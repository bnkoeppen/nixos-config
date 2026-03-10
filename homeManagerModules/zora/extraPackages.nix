{ inputs, ... }:
{
  home.packages = [
    inputs.cider.packages.x86_64-linux.cider-2
  ];
}
