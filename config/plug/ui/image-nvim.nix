{
  plugins = {
    image = {
      enable = true;
      backend = "kitty";
      integrations = {
        markdown = {
          downloadRemoteImages = true;
          enabled = true;
          onlyRenderImageAtCursor = true;
        };
      };
    maxWidth = null;
     maxHeight = null;
     maxWidthWindowPercentage = null;
     maxHeightWindowPercentage = 50;
     windowOverlapClearEnabled = false;
     editorOnlyRenderWhenFocused = false;
     tmuxShowOnlyInActiveWindow = false;
    };
  };
}
