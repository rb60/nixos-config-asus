{ pkgs, ... }:
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
		plugins.direnv.enable = true;
		plugins.csvview.enable = true;

		extraPlugins = [
			pkgs.vimPlugins.plantuml-nvim
			pkgs.vimPlugins.LibDeflate-nvim
		];

		extraConfigLua = ''
			require('plantuml').setup({
            			base_url = 'https://www.plantuml.com/plantuml',
            			reload_events = { 'BufWritePre' },
            			viewer = 'xdg-open',
            			docker_image = 'plantuml/plantuml-server:tomcat'
        		})
    		'';

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
			update_in_insert = true;
		};

		nixpkgs.source = pkgs.path;

	};
}
