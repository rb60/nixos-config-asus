{
	programs.nixvim.plugins.cmp = 
	{
		enable = true;
		settings = {
			sources = [
				{ name = "nvim_lsp";}
			];
			completion =
			{
				autocomplete = 
					[
						"require('cmp.types').cmp.TriggerEvent.TextChanged"
					];
				completeopt = "menu,menuone,noselect";
			};		
		};
	};
}
