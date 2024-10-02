{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hlchunk";
      src = pkgs.fetchFromGitHub {
        owner = "shellRaining";
        repo = "hlchunk.nvim";
        rev = "ba6e2347177fec8ec6af4ae26d11a468c9e0ca72";
        hash = "sha256-IwxyUwL10pop+Aod7BFM67JFXVY37z2Ly4EnlGPwfls=";
      };
    })
  ];

  extraConfigLua = ''
    local default_conf = {
        enable = true,
        notify = false,
        exclude_filetypes = {
            alpha = true,
            dashboard = true,
            -- some other exclude_filetypes
        },
    }

    local chunk_conf = {
        enable = true,
        priority = 15,
        style = {
            { fg = "#A988B0" },
            { fg = "#c21f30" },
        },
        use_treesitter = true,
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        textobject = "",
        max_file_size = 1024 * 1024, -- 1MB
        error_sign = true,
        duration = 200,
        delay = 300,
    }

    local line_num_conf = {
        enable = true,
        style = "#E8E3E3",
        priority = 10,
        use_treesitter = false,
    }

    -- Now merge these configurations into your hlchunk setup
    require('hlchunk').setup({
        chunk = chunk_conf,
        line_num = line_num_conf,
        -- you can add more configurations here
    })
  '';
}
