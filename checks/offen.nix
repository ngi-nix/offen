{ self, nixpkgs, system }:

{
  offen-integration-test =
    with import (nixpkgs + "/nixos/lib/testing-python.nix") {
      inherit system;
    };

    makeTest {
      name = "offen-integration-test";

      nodes.client = { ... }: {
        imports = [ self.nixosModules.offen ];
        nixpkgs.overlays = [ self.overlay ];

        services.offen = {
          enable = true;
          port = 8080;
        };
      };

      testScript = ''
        start_all()

        client.wait_for_unit("offen.service")
        client.wait_for_open_port(8080)

        client.shutdown()
      '';
    };
}
