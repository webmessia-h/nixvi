{
  plugins.mini = {
    enable = true;
    modules = {
      ai = { };
      animate = { };
      surround = { };
      # icons = { };
      hipatterns = {
        highlighters = {
          hex_color.__raw = ''require("mini.hipatterns").gen_highlighter.hex_color()'';
        };
      };
    };
  };
}
