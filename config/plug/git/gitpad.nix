{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "gitpad.nvim";
      version = "1.0";
        src = pkgs.fetchFromGitHub {
      owner = "yujinyuz";
      repo = "gitpad.nvim";
      rev = "1e0f6fa335c72c05d1d3635120c572e198e5ae0d";
      hash = "sha256-mtSb7bpa//kr9DKsABK57J8NpS3TgLiv4ASru0ztCQ0=";
    };
    })
  ];
  extraConfigLua = ''
    require ('gitpad').setup
    ({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
    keys = {
        {
        '<leader>pp',
        function()
        require('gitpad').toggle_gitpad() -- or require('gitpad').toggle_gitpad({ title = 'Project notes' })
        end,
        desc = 'gitpad project',
        },
        {
        '<leader>pb',
        function()
        require('gitpad').toggle_gitpad_branch() -- or require('gitpad').toggle_gitpad_branch({ title = 'Branch notes' })
        end,
        desc = 'gitpad branch',
        },
        {
        '<leader>pvs',
        function()
        require('gitpad').toggle_gitpad_branch({ window_type = 'split', split_win_opts = { split = 'right' } })
        end,
        desc = 'gitpad branch vertical split',
        },

        -- Daily notes
        {
        '<leader>pd',
        function()
        local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
        require('gitpad').toggle_gitpad({ filename = date_filename }) -- or require('gitpad').toggle_gitpad({ filename = date_filename, title = 'Daily notes' })
        end,
        desc = 'gitpad daily notes',
        },
        -- Per file notes
        {
        '<leader>pf',
        function()
        local filename = vim.fn.expand('%:p') -- or just use vim.fn.bufname()
        if filename == "" then
        vim.notify('empty bufname')
          return
        end
        filename = vim.fn.pathshorten(filename, 2) .. '.md'
        require('gitpad').toggle_gitpad({ filename = filename }) -- or require('gitpad').toggle_gitpad({ filename = filename, title = 'Current file notes' })
        end,
        desc = 'gitpad per file notes',
        },
    }
  '';
}
