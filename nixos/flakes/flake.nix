{
  description = "node + mongo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
          };
        };


        nodejs = pkgs.nodejs_20;  
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            nodejs
            pkgs.pnpm
            pkgs.awscli2
            pkgs.git
            pkgs.mongosh
            pkgs.typescript-language-server
          ];

          shellHook = ''
            echo "Dev environment ready"
          '';
        };
      }
    );
}

