{
  plugins.neo-tree = {
    enable = true;
    #renderer.icons.webdevColors = false;
    /*
      buffers.window.mappings = {
        "l" = "open";
        "h" = "close_node";
        "<space>" = "none";
      };
    */
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>e";
      action = ":Neotree<CR>";
      options = {
        silent = true;
        desc = "Tree";
      };
    }
  ];

}
