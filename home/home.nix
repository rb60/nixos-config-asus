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
			RequiresMountsFor = [ "/run/media/tima/Elements" ];
  		};
  		Install = {
    			WantedBy = [ "graphical-session.target" ];
  		};
  		Service = {
    			ExecStart = "${pkgs.qbittorrent}/bin/qbittorrent";
    			Restart = "on-failure";
  		};
};


	
	dconf.settings =
	{
		"org/gnome/desktop/wm/preferences".button-layout = "minimize,maximize,close";
		"org/gnome/settings-daemon/plugins/media-keys" = {
			custom-keybindings = [
				"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
				"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
		    	];
		};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
			binding = "<Primary><Alt>t";
			command = "kitty";
			name = "open-terminal";
		};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
			binding = "<Primary><Alt>v";
			command = "copyq menu";
			name = "copyq menu";
		};
		

		"org/gnome/desktop/wm/keybindings".switch-input-source = ["<Alt>space"];

	};
	
}
