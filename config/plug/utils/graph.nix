{ pkgs, lib, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "diagram.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "3rd";
        repo = "diagram.nvim";
        rev = "d19b9bb2ca162facc242c357c2802b8cfab6b55c";
        hash = "sha256-WT6cGIPvBURNtFhC6Kefkwm+GX8jIAW0pzsCzCRcj2k=";
      };
    })
  ];
}
