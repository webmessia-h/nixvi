{ pkgs, ...}:
{
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin{
      pname = "diagram.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "3rd";
        repo = "diagram.nvim";
        rev = "v${version}";
        hash = lib.fakeHash;
      };
    })
  ];
}
