{
	imports = [ ./plugins/bufferline.nix 
		    ./plugins/lualine.nix
		    ./plugins/nvim_tree.nix
		    ./plugins/web_devicons.nix 
		    ./plugins/dashboard.nix
		    ./plugins/toggleterm.nix
		    ./plugins/image.nix
		    ./plugins/cmp.nix
		    ./plugins/lsp/lsp.nix];


	programs.nixvim = 
	{
		enable = true;
		plugins.cmp-nvim-lsp.enable = true;
		clipboard.providers.xclip.enable = true;
		keymaps = [
			{
				action = ":NvimTreeToggle<Enter>";
				key = "<C-n>";
				options = 
				{
					silent = true;
				};
			}
			];

		diagnostic.settings = {
			virtual_lines = {
				current_line = true;
			};
			virtual_text = false;
		};

	};
}
