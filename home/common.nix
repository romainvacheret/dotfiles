{ pkgs, pkgsUnstable, ... }:

{
  home.packages = [
    pkgs.eza
    pkgs.ghostty
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
