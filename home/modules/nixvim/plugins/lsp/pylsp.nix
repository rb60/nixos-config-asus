{
	programs.nixvim.plugins.lsp.servers.pylsp = 
	{
		enable = true;
		settings.plugins =
		{
			rope.enabled = true;
			flake8.enabled = true;
		};
	};
}
