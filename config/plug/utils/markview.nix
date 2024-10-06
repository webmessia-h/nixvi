{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin rec {
      pname = "markview.nvim";
      version = "24.0.0";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "refs/tags/v${version}";
        hash = "sha256-Bkwhg4RstOSRx+Jmjq5n2xjEkvyZ4Mx85lWn0YqRHxY=";
      };
    })
  ];

  extraConfigLua = ''
    local markview = require("markview");
    local presets = require("markview.presets");
    markview.setup({
        headings = presets.headings.glow,
        checkboxes = presets.checkboxes.nerd,
        checkboxes = {
          enable = true,
        },
        latex = {
          enable = true,
          brackets = {
            enable = true,
            opening = {
              { "(", "MarkviewHeading1Sign" },
              { "{", "MarkviewHeading2Sign" },
              { "[", "MarkviewHeading3Sign" },
            },
            closing = {
              { ")", "MarkviewHeading1Sign" },
              { "}", "MarkviewHeading2Sign" },
              { "]", "MarkviewHeading3" },
            },
            scope = {
              "DiagnosticVirtualTextError",
              "DiagnosticVirtualTextOk",
              "DiagnosticVirtualTextWarn",
            },
          },
          inline = {
            enable = true
          },
          block = {
            enable = true,
            hl = "Code",
            text = { " Latex ", "Special" }
          },
          symbols = {
            enable = true,
            overwrite = {}
          },
          operators = {
            enable = true,
          },
          subscript = {
            enable = true
          },
          superscript = {
            enable = true
          },
        },
      })'';
}
