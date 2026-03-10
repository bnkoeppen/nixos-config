{ pkgs, ... }:
with pkgs.vscode-extensions;
[
  mkhl.direnv
  sainnhe.gruvbox-material
  ms-python.python
  golang.go
  ms-toolsai.jupyter
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "quarto";
    publisher = "quarto";
    version = "1.130.0";
    sha256 = "sha256-3jbQ2IemKCSD4mzNA5zxAn5pYxglJ51fyM/1kMEfApM=";
  }
  {
    name = "gruvbox-material-community";
    publisher = "snrico-moonlight";
    version = "8.0.0";
    sha256 = "sha256-2uZOtoLQr4MVvK41Azb1ax8Go0hXgQzTqvkvsMUymxA=";
  }
]
