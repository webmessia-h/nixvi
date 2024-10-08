{ config, lib, ... }:
{
  imports = [
    # Base settings
    ./autocommands.nix
    ./keys.nix
    ./sets.nix
    ./highlight.nix

    # Colorschemes
    ./plug/colorscheme/biscuit.nix
    ./plug/colorscheme/colorscheme.nix

    # Completion and LSP
    ./plug/completion/cmp.nix
    ./plug/completion/lspkind.nix
    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/hlchunk.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/none-ls.nix
    ./plug/lsp/clangd-extensions.nix

    # Git integration
    ./plug/git/gitlinker.nix
    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix
    ./plug/git/worktree.nix
    ./plug/git/gitpad.nix
    ./plug/git/gitblame.nix

    # Snippets
    ./plug/snippets/luasnip.nix

    # Statusline
    ./plug/statusline/lualine.nix
    #./plug/statusline/staline.nix

    # Treesitter
    ./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    # UI Enhancements
    ./plug/ui/web-devicons.nix
    ./plug/ui/dressing.nix
    ./plug/ui/smart-splits.nix
    ./plug/ui/alpha.nix
    ./plug/ui/bufferline.nix
    ./plug/ui/indent-blankline.nix
    ./plug/ui/noice.nix
    ./plug/ui/nvim-notify.nix
    ./plug/ui/telescope.nix
    ./plug/ui/project.nix
    #./plug/ui/image-nvim.nix
    #./plug/ui/nabla.nix

    # Utility Plugins
    ./plug/utils/comment.nix
    ./plug/utils/wakatime.nix
    ./plug/utils/comment-box.nix
    ./plug/utils/flash.nix
    ./plug/utils/trouble.nix
    ./plug/utils/grapple.nix
    ./plug/utils/hardtime.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/markview.nix
    ./plug/utils/colorizer.nix
    ./plug/utils/mini.nix
    ./plug/utils/neo-tree.nix
    ./plug/utils/nvim-autopairs.nix
    ./plug/utils/obsidian.nix
    ./plug/utils/oil.nix
    ./plug/utils/ufo.nix
    ./plug/utils/undotree.nix
    ./plug/utils/whichkey.nix
    #./plug/utils/vim-be-good.nix
    #./plug/utils/harpoon.nix
    #./plug/utils/graph.nix
  ];

  # Theme options
  options = {
    theme = lib.mkOption {
      default = lib.mkDefault "paradise";
      type = lib.types.enum [
        "paradise"
        "decay"
        "edge-dark"
        "mountain"
        "tokyonight"
        "everforest"
        "everblush"
        "jellybeans"
        "aquarium"
        "gruvbox"
      ];
    };
  };

  # Configuration
  config = {
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
