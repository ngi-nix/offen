# Maintenance

The Nix expressions for the JS packages are generated automatically using
[node2nix][node2nix]. So when updating the Offen dependency, these need to be
regenerated using the supplied script:

    nix flake update --update-input offen-src
    scripts/update-node-packages.sh

[node2nix]: https://github.com/svanderburg/node2nix
