{ pkgs, pkgsUnstable, ... }:

{
  home.packages = [
    pkgs.eza
    pkgs.lazygit
    pkgsUnstable.neovim
    pkgs.ripgrep
    pkgs.superfile
    pkgs.tokei
    pkgs.tmux
    pkgs.tree
  ];

  home.file = {
    ".config/ghostty/config" = {
      source = ../.config/ghostty/config;
      force = true;
    };

    ".config/nix/nix.conf" = {
      source = ../.config/nix/nix.conf;
      force = true;
    };

    ".config/nvim" = {
      source = ../.config/nvim;
      force = true;
    };

    ".tmux.conf" = {
      source = ../.tmux.conf;
      force = true;
    };
  };

  programs.home-manager.enable = true;
}
