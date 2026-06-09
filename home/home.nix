{ config, pkgs, ...}:
{

	
	nixpkgs.config.allowUnfree = true;
	home = {
		username = "tima";
		homeDirectory = "/home/tima";
		stateVersion = "25.05";
		packages = [ 
			pkgs.telegram-desktop 
			pkgs.kitty-themes
			pkgs.freecad
			pkgs.gajim
			pkgs.qbittorrent
			pkgs.anydesk];
	};

	
	imports = [
		./modules/git.nix
		./modules/github.nix
		./modules/nixvim/nixvim.nix
		./modules/bash/bash.nix
		./modules/kitty/kitty.nix
	];

	programs.direnv =
	{
		enable = true;
		enableBashIntegration = true;
	};

	systemd.user.services.qbittorrent = {
  		Unit = {
    			Description = "qBittorrent user service";
    			After = [ "graphical-session.target" ];
			RequiresMountsFor = [ "/mnt/Elements" ];
  		};
  		Install = {
    			WantedBy = [ "graphical-session.target" ];
  		};
  		Service = {
    			ExecStart = "${pkgs.qbittorrent}/bin/qbittorrent";
    			Restart = "on-failure";
			TimeoutStopSec = "15s";
  		};
};


	
	
	
}
