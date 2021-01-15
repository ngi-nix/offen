This repository provides a Nix flake to run [Offen](https://www.offen.dev/), a
fair and open web analytics tool. It provides the Offen server as a Nix package
as well as a NixOS module to run it as a systemd service.


# Usage

Using flake support in Nix you can run Offen by directly pulling & executing the
flake. You should provide some basic environment variables for a database, e.g.
sqlite:

```sh
export OFFEN_DATABASE_DIALECT=sqlite3
export OFFEN_DATABASE_CONNECTIONSTRING=$(pwd)/offen.db
nix run github:ngi-nix/offen
```

Or run the demo to see Offen in action without setup:

```sh
nix run github:ngi-nix/offen demo
```

If you want to use Offen on a NixOS server, you can use the module provided by
the flake. Provided you have added the flake as an input called `offen`, you can
merge this code into your configuration:

```nix
{
    imports = [ offen.nixosModules.offen ];
    nixpkgs.overlays = [ offen.overlay ];
    services.offen.enable = true;
}
```

Have a look at `modules/offen.nix` for a documentation of available settings.


# Development & maintenance

Use the shell definition in the flake to get a development environment that
contains all packages required to build and work on the flake:

    nix-shell

If you use [direnv](https://direnv.net/), an `.envrc` is provided in the
repository.

The Nix expressions for the JS packages are generated automatically using
[node2nix](https://github.com/svanderburg/node2nix). So when updating the Offen
dependency, these need to be regenerated using the supplied script:

    nix flake update --update-input offen-src
    scripts/update-node-packages.sh
