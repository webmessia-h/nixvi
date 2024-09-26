{ config, ... }:
let
  colors = import ../../colors/${config.theme}.nix { };
in
{
  plugins.lualine = {
    enable = true;
    globalstatus = true;
    disabledFiletypes = {
      statusline = [
        "dashboard"
        "alpha"
        "starter"
      ];
    };
    theme = {
      normal = {
        a = {
          bg = "#nil";
        };
        b = {
          bg = "nil";
        };
        c = {
          bg = "nil";
        };
        z = {
          bg = "nil";
        };
        y = {
          bg = "nil";
        };
      };
    };
    inactiveSections = {
      lualine_x = [
        "filename"
        "filetype"
      ];
    };
    sections = {
      lualine_a = [
        {
          name = "mode";
          fmt = "string.lower";
          color = {
            fg = if config.colorschemes.base16.enable then colors.base04 else "nil";
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }
      ];
      lualine_b = [
        {
          name = "branch";
          icon = "";
          color = {
            fg = if config.colorschemes.base16.enable then colors.base04 else "nil";
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }
        {
          name = "diff";
          separator.left = "";
          separator.right = "";
        }
      ];
      lualine_c = [
        {
          name = "diagnostic";
          extraConfig = {
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          };
          color = {
            fg = if config.colorschemes.base16.enable then colors.base04 else "nil";
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }
      ];
      lualine_x = [ "" ];
      lualine_y = [
        {
          name = "filetype";
          extraConfig = {
            icon_only = true;
          };
          separator.left = "";
          separator.right = "";
        }
        {
          name = "filename";
          extraConfig = {
            symbols = {
              modified = "";
              readonly = "👁️";
              unnamed = "";
            };
          };
          color = {
            fg = if config.colorschemes.base16.enable then colors.base05 else "nil";
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }
      ];
      lualine_z = [
        {
          name = "location";
          color = {
            fg = if config.colorschemes.base16.enable then colors.base0B else "nil";
            bg = "nil";
          };
          separator.left = "";
          separator.right = "";
        }
      ];
    };
  };
  extraConfigLua = ''
      opts = function(_, opts)
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end
  '';
}
