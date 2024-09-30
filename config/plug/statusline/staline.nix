{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "staline.nvim";
      version = "2024-02-06";
      src = pkgs.fetchFromGitHub {
        owner = "tamton-aquib";
        repo = "staline.nvim";
        rev = "d337bc9b343df3328921ef4c3f8ff604102d0201";
        hash = "sha256-HkuVio/F8HOb6k9N8LkYdQ1vheuyjrqP25RforoWZSk=";
      };
    })
  ];
  extraConfigLua = ''
      require("staline").setup({
        --exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
      sections = {
        left = { "mode", " ", "branch" },
        mid = { "lsp" },
        right = { "file_name", "line_column" },
      },
      inactive_sections = {
        left = { "mode", " ", "branch" },
        mid = { "lsp_name" },
        right = { "file_name", "line_column" },
      },
      defaults = {
        left_separator = " ",
        right_separator = "  ",
        branch_symbol = " ",
        mod_symbol = "",
        line_column = "%l:%L",
        inactive_color = "#80a6f2", --#303030 is the default
        inactive_bgcolor = "none",
      },
      special_table = {
        TelescopePrompt = { "Telescope", "  " },
        oil = { "Oil", "󰏇 " },
        lazygit = { "LazyGit", " " },
      },
      mode_icons = {
        ["n"] = "normal",
        ["no"] = "normal",
        ["nov"] = "normal",
        ["noV"] = "normal",
        ["niI"] = "normal",
        ["niR"] = "normal",
        ["niV"] = "normal",
        ["i"] = "insert",
        ["ic"] = "insert",
        ["ix"] = "insert",
        ["s"] = "insert",
        ["S"] = "insert",
        ["v"] = "visual",
        ["V"] = "visual",
        [""] = "visual",
        ["r"] = "replace",
        ["r?"] = "replace",
        ["R"] = "replace",
        ["c"] = "command",
        ["t"] = "terminal",
      },
    })
  '';
}
