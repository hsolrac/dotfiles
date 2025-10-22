{
  description = "NixOS configuration with flake-based nixpkgs-unstable overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }: {
    nixosConfigurations.nixos-flakes-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ({ pkgs, ... }: {
          _module.args.unstable = import nixpkgs-unstable {
            system = pkgs.system;
            config.allowUnfree = true;
            overlays = [
              (import (builtins.fetchTarball {
                url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
              }))
            ];
          };
        })
      ];
    };
  };
}
