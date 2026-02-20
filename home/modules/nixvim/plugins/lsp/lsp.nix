{
	imports = [
		./nixd.nix
		./pylsp.nix
		./html.nix
		./java.nix
	];
	programs.nixvim.plugins.lsp = 
	{
		enable = true;
		inlayHints = true;
	};
}
