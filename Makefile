.PHONY: switch build update clean

switch:
	home-manager switch --flake .#gero

build:
	nix build .#nixosConfigurations.nixos.config.system.build.toplevel

update:
	nix flake update

clean:
	sudo nix-collect-garbage -d
