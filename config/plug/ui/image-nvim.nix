{
  plugins = {
    image-nvim = {
  	enable = true;
 	 extraConfigLua = ''
     	  event = { "BufReadPre", "BufNewFile" },
  	   opts = {
 	    integrations = {
      	     markdown = { only_render_image_at_cursor = true },
    	    },
  	   }
	 '';
   };
 };
}
