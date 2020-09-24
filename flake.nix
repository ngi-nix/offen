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
      overlay = final: prev:
        with final;
        {
          offen = buildGoModule {
            pname = "offen";
            inherit version;
            src = "${offen-src}/server";
            vendorSha256 = "0phki0cvagd32rsz0pwbgpdgf7vblj515hw20r62g3mfq2qrwlm4";
          };
        };

      packages = forAllSystems (system: {
        offen = nixpkgsFor.${system}.offen;
      });

      defaultPackage = forAllSystems (system: self.packages.${system}.offen);
    };
}
