{ ... }:

{
  imports = [
    ../home/common.nix
  ];

  home.username = "romain";
  home.homeDirectory = "/home/romain";

  home.stateVersion = "24.11";
}
