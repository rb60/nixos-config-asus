{
	imports = [
		./nixd.nix
		./pylsp.nix
		./html.nix
		./java.nix
		./json.nix
	];
	programs.nixvim.plugins.lsp = 
	{
		enable = true;
		inlayHints = true;
	};
}
