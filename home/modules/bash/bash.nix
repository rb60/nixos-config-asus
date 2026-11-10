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
						# Віджет для перехоплення Alt+w та передачі тексту у wl-copy
						function ble/widget/blerc/copy-to-clipboard {
							ble/widget/copy-region-or copy-uword
							if type wl-copy &>/dev/null && [[ ''${_ble_edit_kill_ring[0]} ]]; then
								printf '%s' "''${_ble_edit_kill_ring[0]}" | wl-copy
							fi
						}
						ble-bind -m emacs 'M-w' blerc/copy-to-clipboard

					ble-attach
				fi
			fi
			'';
	};
}
