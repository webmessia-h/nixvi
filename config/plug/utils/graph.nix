{ pkgs, lib, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "diagram.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "3rd";
        repo = "diagram.nvim";
        rev = "master";
        hash = "sha256-UmF5evvSSRXsIPRVukB8Jy+ovv1w9QEIbkt5LA7fHiA=";
      };
    })
  ];
}
