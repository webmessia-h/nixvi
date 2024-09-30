{ pkgs, ... }:
{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings = {
      updateInInsert = false;
    };
    sources = {
      code_actions = {
        gitsigns.enable = false;
        statix.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        cppcheck = {
          enable = true;
          settings = {
            disabled_filetypes = [
              "h"
              "hpp"
            ];
            extra_args = [
              "--check-level=exhaustive"
              "--enable=warning,style,performance,portability"
              "--template=gcc"
              #"--addon=misra.py"
            ];
            extra_filetypes = [
              "cpp"
              "c"
            ];
          };
        };
        checkmake.enable = true;
      };
      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        black = {
          enable = true;
          settings = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
          settings = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
        clang_format.enable = true;
        stylua.enable = true;
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
