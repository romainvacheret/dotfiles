{ pkgs, ... }:

{
  imports = [
    ../home/common.nix
  ];

  home.username = "romain";
  home.homeDirectory = "/home/romain";

  home.packages = [
    # Keep disabled on Ubuntu because fails with an OpenGL error
    # pkgs.ghostty
    pkgs.i3
  ];

  home.file.".config/i3/config" = {
    source = ../.config/i3/config;
    force = true;
  };

  home.stateVersion = "24.11";
}
