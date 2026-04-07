{
  users.users.navidrome = {
    isSystemUser = true;
    group = "navidrome";
  };
  users.groups.navidrome = { };
  services.navidrome = {
    enable = true;
    openFirewall = true;
  };
}
