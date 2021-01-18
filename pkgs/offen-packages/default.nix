# This package has only been wrapped to provide license information, as its
# sources are already contained in the other packages.

{ python2, fetchurl, fetchgit, utillinux, runCommand, writeTextFile, stdenv, nodePackages, nodejs }@pkgs:
{ offenSrc, version }:

let
  nodePackages = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };

  nodeDependencies = (nodePackages.shell.override {
    src = "${offenSrc}/packages";

    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "yes";
  }).nodeDependencies;

in

stdenv.mkDerivation {
  name = "offen-packages";
  src = "${offenSrc}/packages";
  inherit version;

  buildInputs = [ nodejs ];

  buildPhase = ''
    ADBLOCK=true
    DISABLE_OPENCOLLECTIVE=true
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

    ln -s ${nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"

    npm run licenses
  '';

  installPhase = ''
    mkdir -p $out/
    cp dependencies.csv $out/
  '';
}
