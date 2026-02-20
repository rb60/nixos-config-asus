{pkgs, ...}:
{
	programs.nixvim.plugins.lsp.servers.java_language_server = 
	{
		enable = true;
		cmd = ["${pkgs.java-language-server}/share/java/java-language-server/lang_server_linux.sh"];
	};
}
