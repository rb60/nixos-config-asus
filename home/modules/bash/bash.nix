{pkgs, ...}:
{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "/home/tima/nix/home/modules/bash/scripts/rebuild.sh";
			rebuild-home = "/home/tima/nix/home/modules/bash/scripts/rebuild-home.sh";
		};
		initExtraFirst = ''
			if [[ $- == *i* ]]; then
				source ${pkgs.blesh}/share/ble-sh/ble.sh --noattach
					fi
					'';

		# Фіналізуємо прив'язку ble.sh наприкінці .bashrc (після завантаження всіх аліасів та функцій)
		initExtra = ''
			if [[ $- == *i* ]]; then
				ble-attach
					fi
					'';

	};
}
