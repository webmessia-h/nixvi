{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin rec {
      pname = "vim-be-good";
      src = pkgs.fetchFromGitHub {
        owner = "ThePrimeagen";
        repo = "vim-be-good";
        rev = "main";
        hash = "";
      };
    })
  ];
  # ThePrimeagen/vim-be-good
}

#extraConfigLua
