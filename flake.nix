{
  description = "Offen, a fair web analytics tool";

  inputs.nixpkgs = {
    type = "github";
    owner = "NixOS";
    repo = "nixpkgs";
    ref = "nixos-20.09";
  };

  inputs.offen-src = {
    type = "github";
    owner = "offen";
    repo = "offen";
    flake = false;
  };

  outputs = { self, nixpkgs, offen-src, ... }:

    let

      # Generate a user-friendly version numer.
      version = builtins.substring 0 8 offen-src.lastModifiedDate;

      # System types to support.
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; overlays = [ self.overlay ]; });

    in

    {
      overlay = final: prev: with final; rec {
        license_finder = callPackage ./pkgs/license_finder {};

        offen = callPackage ./pkgs/offen-server {} {
          src = offen-src;
          inherit version;
        };

        offen-auditorium = callPackage ./pkgs/offen-auditorium {} {
          offenSrc = offen-src;
          inherit version;
        };

        offen-script = callPackage ./pkgs/offen-script {} {
          offenSrc = offen-src;
          inherit version;
        };

        offen-vault = callPackage ./pkgs/offen-vault {} {
          offenSrc = offen-src;
          inherit version;
        };
      };

      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};

        in {
          inherit (pkgs) license_finder offen offen-auditorium offen-script offen-vault;
        }
      );

      defaultPackage = forAllSystems (system: self.packages.${system}.offen);

      nixosModules.offen = import modules/offen.nix;

      checks = forAllSystems (system:
        self.packages.${system}
          // import ./checks/offen.nix { inherit self nixpkgs system; }
      );

      devShell = forAllSystems (system:
        with nixpkgsFor.${system};
        mkShell {
          buildInputs = [
            git
            nixFlakes
            nodePackages.node2nix
          ];
        }
      );
    };
}
