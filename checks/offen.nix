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

        # Make sure the service has not crashed immediately
        client.sleep(1)
        client.require_unit_state("offen.service", "active")

        # Check presence of sqlite database
        client.wait_for_file("/var/lib/offen/db.sqlite")

        # Test HTTP responses
        client.wait_for_open_port(8080)
        client.succeed("curl http://localhost:8080")

        client.shutdown()
      '';
    };
}
