{
	imports = [
		./nixd.nix
		./pylsp.nix
		./html.nix
		./java.nix
		./json.nix
		./ltex.nix
	];
	programs.nixvim.plugins.lsp = 
	{
		enable = true;
		inlayHints = true;
	};
}
