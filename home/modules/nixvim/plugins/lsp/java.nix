{
	programs.nixvim.plugins.lsp.servers.java_language_server = 
	{
		enable = true;
		cmd = ["./lang_server_linux.sh"];
	};
}
