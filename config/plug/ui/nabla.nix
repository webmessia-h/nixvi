{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "nabla.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "jbyuki";
        repo = "nabla.nvim";
        rev = "27a6ea9ed7452bb9e0b19eb0942b5bcf7d051b2f";
        hash = "";
      };
    })
  ];

  extraConfigLua = ''
    nnoremap <leader>p :lua require("nabla").popup()<CR> '';
}
