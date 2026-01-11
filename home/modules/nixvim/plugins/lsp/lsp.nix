{
	imports = [
		./nixd.nix
		./pylsp.nix
		./html.nix
	];
	programs.nixvim.plugins.lsp = 
	{
		enable = true;
		inlayHints = true;
	};
}
