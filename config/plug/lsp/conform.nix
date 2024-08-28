{
  plugins.conform-nvim = {
    enable = true;
    settings = {

      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;

      formatters_by_ft = {
        liquidsoap = [ "liquidsoap-prettier" ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
      };
    };
  };
}
