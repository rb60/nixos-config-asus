{
	programs.nixvim.plugins.toggleterm = 
	{
		enable = true;
		settings = {
			insert_mappings = true;
    			terminal_mappings = true;
  			direction = "horizontal";
  			open_mapping = "[[<c-t>]]";
		};
		
	};
}
