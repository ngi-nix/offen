{
  description = "Flake for Offen, a fair web analytics tool";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.offen = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.offen;

  };
}
