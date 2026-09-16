{ pkgs, ... }:

{
  home.packages = [
    pkgs.ripgrep
  ];

  programs.home-manager.enable = true;
}
