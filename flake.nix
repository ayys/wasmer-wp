{
  description = "PHP environment for WordPress development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.php84

            pkgs.php84Packages.composer
          ];

          shellHook = ''
            echo "WordPress PHP environment ready!"
            echo "Run: php -S localhost:8000 -t ."
          '';
        };
      });
}
