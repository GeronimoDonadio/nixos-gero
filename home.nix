{ config, pkgs, ... }:

{
  home.username = "gero";
  home.homeDirectory = "/home/gero";

  home.packages = with pkgs; [
    kitty
    obsidian
    pycharm-professional
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" ];
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ git curl gcc ];
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      telescope-nvim
      plenary-nvim
      nvim-treesitter
      harpoon
      trouble-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      friendly-snippets
      lsp-zero-nvim
      nvim-lspconfig
      nvim-dap
      null-ls-nvim
      tokyonight-nvim
    ];
  };

  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11";
}
