{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin rec {
      pname = "vim-be-good";
      version = "4fa57b7957715c91326fcead58c1fa898b9b3625";
      src = pkgs.fetchFromGitHub {
        owner = "ThePrimeagen";
        repo = "vim-be-good";
        rev = "4fa57b7957715c91326fcead58c1fa898b9b3625";
        hash = "sha256-XVFq3Gb4C95Y0NYKk08ZjZaGLVF6ayPicIAccba+VRs=";
      };
    })
  ];
  # ThePrimeagen/vim-be-good
}

#extraConfigLua
