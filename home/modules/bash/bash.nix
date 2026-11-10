{pkgs, ...}:
{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "/home/tima/nix/home/modules/bash/scripts/rebuild.sh";
			rebuild-home = "/home/tima/nix/home/modules/bash/scripts/rebuild-home.sh";
		};
		initExtra = ''
				if [[ $- == *i* ]]; then
				if [[ -f ${pkgs.blesh}/share/blesh/ble.sh ]]; then
					source ${pkgs.blesh}/share/blesh/ble.sh --noattach
						ble-attach
						fi
						fi
				'';
	};
}
