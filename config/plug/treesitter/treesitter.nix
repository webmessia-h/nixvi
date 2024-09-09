{ pkgs, ... }:
{
  filetype.extension.liq = "liquidsoap";

  plugins.treesitter = {
    enable = true;

    settings = {
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };

    folding = true;
    languageRegister.liq = "liquidsoap";
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.liquidsoap = {
      filetype = "liquidsoap",
    }

    -- LaTeX Parser Configuration
    parser_config.latex = {
      install_info = {
        url = "https://github.com/latex-lsp/tree-sitter-latex",
        files = { "src/parser.c", "src/scanner.cc" },
      },
      filetype = "md",  -- Recognize .tex files as LaTeX
    }
  '';
}
