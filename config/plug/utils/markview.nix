{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin rec {
      pname = "markview.nvim";
      version = "23.1.0";
      src = pkgs.fetchFromGitHub {
        owner = "OXY2DEV";
        repo = "markview.nvim";
        rev = "refs/tags/v${version}";
        hash = "sha256-LBDPTWmFzVsX9OWc6Zo8iilczYbVR4cxNA2Fgirg4/Y=";
      };
    })
  ];

  extraConfigLua = ''
  local markview = require("markview");
  local presets = require("markview.presets");

  markview.setup({
    headings = presets.headings.glow_labels;
    Checkboxes = {
    enable = true,

    checked = {
        text = "✅", hl = "TabLineSel"
    },

    unchecked = {},
    pending = {},

    custom = {
        {
            match = "~",
            text = "◕",
            hl = "CheckboxProgress"
        }
    }
  };

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

        -- scope = {
        --  "DiagnosticVirtualTextError",
        --  "DiagnosticVirtualTextOk",
        --  "DiagnosticVirtualTextWarn",
        -- }
    },

    -- Hides $$ inside lines
    inline = {
        enable = true
    },

    -- Highlights lines within $$ $$
    block = {
        hl = "Code",
        text = { " Latex ", "Special" }
    },

    -- Symbols, e.g. \geq
    symbols = {
        enable = true,
        -- Your own set of symbols, e.g.
        -- {
        --   name = "symbol"
        -- }
        overwrite = {}
    },

    subscript = {
        enable = true
    },
    superscript = {
        enable = true
    },
  };
  vim.cmd("Markview enableAll");
  });
    '';
}
