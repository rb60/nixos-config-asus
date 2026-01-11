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

	systemd.user.services.qbittorrent = {
		Unit = {
			Description = "qBitTorrent";
			After = ["graphical-session-pre.target" "run-media-tima-Elements.mount"];
			PartOf = ["graphical-session.target"];
		};

		Service = {
			ExecStartPre = pkgs.writeShellScript "wait-for-mount" ''
			until [ -d "/run/media/tima/Elements" ]
			do
				sleep 2
			done
			sleep 15
			'';
			ExecStart = "${pkgs.qbittorrent}/bin/qbittorrent";
			Restart = "on-failure";
		};

		Install = {
			WantedBy = ["graphical-session.target"];
		};
	};

	
	dconf.settings."org/gnome/desktop/wm/preferences".button-layout = "minimize,maximize,close";
	dconf.settings."org/gnome/Console" = 
	{
		custom-font = "Agave Nerd Font 10";
		font-scale = 1.2;
		use-system-font = false;

	};
	
}
