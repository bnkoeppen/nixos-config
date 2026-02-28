{ inputs, ... }:
{
  inputs.nixpkgs.overlays = [
    zed-extensions.overlays.default
  ];
}
