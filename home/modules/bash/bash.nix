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
				source ${pkgs.blesh}/share/ble-sh/ble.sh --noattach
					ble-attach
					fi
					'';
	};
}
