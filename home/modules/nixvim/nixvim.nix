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
		    ./plugins/lsp/lsp.nix
		    ./plugins/markview.nix];


	programs.nixvim = 
	{
		enable = true;
		colorschemes.rose-pine.enable = true;
		colorschemes.rose-pine.settings.variant = "moon";

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

		extraPackages = with pkgs; [
    			wl-clipboard
    			xclip
  		];


		globals = {
			clipboard = {
				name = "wl-clipboard";
				copy = {
					"+" = "wl-copy";
					"*" = "wl-copy";
				};
				paste = {
					"+" = "wl-paste --no-newline";
					"*" = "wl-paste --no-newline";
				};
				cache_enabled = 1;
			};
		};
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
			{
				action = "p=']^";
				key = "p";
			}
			{
				action = "P='[^";
				key = "P";
			}
			{
				mode = [ "n" "v" ];
				key = "<Down>";
				action = "v:count == 0 ? 'gj' : 'j'";
				options = {
					expr = true;
					silent = true;
				};
			}
			{
				mode = [ "n" "v" ];
				key = "<Up>";
				action = "v:count == 0 ? 'gk' : 'k'";
				options = {
					expr = true;
					silent = true;
				};
			}
			{
				mode = "t";
					key = "<C-r>+";
					action = ''
					<cmd>lua function()
						local clipboard_data = vim.g.clipboard.paste['+']()
						if clipboard_data and #clipboard_data > 0 then
							local text = table.concat(clipboard_data, "\n")
							if text ~= "" then
								vim.api.nvim_chan_send(vim.b.terminal_job_id, text)
							end
						end
					end()
					<CR>
							'';
				options = {
					desc = "Paste raw text directly to terminal channel";
					silent = true;
					noremap = true;
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

		opts = {
			wrap = true;          
    			breakindent = true;   
    			showbreak = "↳ ";     
    			breakindentopt = "shift:2";
			number = true;
			clipboard = "unnamedplus";
		};

		nixpkgs.source = pkgs.path;

	};
}
