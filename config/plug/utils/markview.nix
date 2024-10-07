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
        latex = {
          brackets = {
            enable = true,
            hl = "@puntuation.brackets",
          },
          inline = {
            enable = true,
          },
          block = {
            enable = true,
          },
          symbols = {
            enable = true,
          },
          operators = {
            enable = true,
          },
          subscript = {
            enable = true,
          },
          superscript = {
            enable = true,
          },
        },
        headings = presets.headings.glow,
       -- checkboxes = presets.checkboxes.nerd,
    })'';
}
