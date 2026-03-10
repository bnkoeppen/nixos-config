{
  config,
  ...
}:
let
  isEd25519 = k: k.type == "ed25519";
  getKeyPath = k: k.path;
  keys = builtins.filter isEd25519 config.services.openssh.hostKeys;
in
{
  sops = rec {
    age.sshKeyPaths = map getKeyPath keys;
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    secrets.tailscaleKey = {
      sopsFile = defaultSopsFile;
    };
  };
}
