{
	programs.nixvim.plugins.cmp = 
	{
		enable = true;
		autoEnableSources = true;
		settings = {
			sources = [
				{ name = "nvim_lsp"; }  
        			{ name = "luasnip"; }   
        			{ name = "path"; }      
        			{ name = "buffer"; }    
			];
			completion =
			{
				completeopt = "menu,menuone,noselect";
			};		
		};
	};
	programs.nixvim.plugins.luasnip.enable = true;
}
