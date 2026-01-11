{
	programs.nixvim.plugins.dashboard = 
	{
		enable = true;
		settings = {
  			change_to_vcs_root = true;
  			config = {
				packages = { enable = false; };
    				footer = [
      					"####"
    				];
    				header = [
      					"███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
      					"████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
      					"██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
      					"██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
      					"██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
      					"╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
    				];
    				mru = {
      					limit = 20;
    				};
    				project = {
      					enable = false;
    				};
    				shortcut = [
					{
						desc = "Files";
						action = "NvimTreeToggle";
						key = "f";
					}
				];
    				week_header = {
      					enable = true;
    				};
  			};
  		theme = "hyper";
		};
		
	};
}
