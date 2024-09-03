{ pkgs, lib, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "symbol-outline.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "hedyhli";
        repo = "outline.nvim";
        rev = "e2fc8d8e10205a65f13581504674f4d305c1abe8";
        hash = "sha256-8MAFlny0l5sRxop+KYDSjv/6lZNz8aWUEG8MLdqJhMM=";
      };

    })
  ];
  extraConfigLua = ''require("outline").setup({
  vim.keymap.set('n', '<leader>us', ':OutlineOpen<CR>', { noremap = true, silent = true, desc = "Toggle Outline" }),
  opts = { 
    outline_window = {
    -- Where to open the split window: right/left
    position = 'left',
     -- Percentage or integer of columns
    width = 30,
    -- Whether width is relative to the total width of nvim
    -- When relative_width = true, this means take 25% of the total
    -- screen width for outline window.
    relative_width = true,

    -- Auto close the outline window if goto_location is triggered and not for
    -- peek_location
    auto_close = false,
    -- Automatically scroll to the location in code when navigating outline window.
    auto_jump = false,
    -- boolean or integer for milliseconds duration to apply a temporary highlight
    -- when jumping. false to disable.
    jump_highlight_duration = 300,
    -- Whether to center the cursor line vertically in the screen when
    -- jumping/focusing. Executes zz.
    center_on_jump = true,

    -- Vim options for the outline window
    show_numbers = false,
    show_relative_numbers = false,
    wrap = false,

    -- true/false/'focus_in_outline'/'focus_in_code'.
    -- The last two means only show cursorline when the focus is in outline/code.
    -- 'focus_in_outline' can be used if the outline_items.auto_set_cursor
    -- operations are too distracting due to visual contrast caused by cursorline.
    show_cursorline = true,
    -- Enable this only if you enabled cursorline so your cursor color can
    -- blend with the cursorline, in effect, as if your cursor is hidden
    -- in the outline window.
    -- This makes your line of cursor have the same color as if the cursor
    -- wasn't focused on the outline window.
    -- This feature is experimental.
    hide_cursor = false,

    -- Whether to auto-focus on the outline window when it is opened.
    -- Set to false to *always* retain focus on your previous buffer when opening
    -- outline.
    -- If you enable this you can still use bangs in :Outline! or :OutlineOpen! to
    -- retain focus on your code. If this is false, retaining focus will be
    -- enforced for :Outline/:OutlineOpen and you will not be able to have the
    -- other behaviour.
    focus_on_open = true, },

    symbols = {
      filter = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Variable",
      }
    },
  }
})
'';
}