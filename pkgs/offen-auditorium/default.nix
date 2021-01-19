{ python2, fetchurl, fetchgit, utillinux, runCommand, writeTextFile, stdenv, nodePackages, nodejs, callPackage }@pkgs:
{ offenSrc, version }:

let
  nodePackagesRaw = import ./composition.nix {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };

  nodePackages = nodePackagesRaw.override (old:
    {
      sources = old.sources // {
        "offen-../packages" = old.sources."offen-../packages" // {
          src = "${offenSrc}/packages";
        };
      };
    }
  );

  nodeDependencies = (nodePackages.shell.override {
    src = "${offenSrc}/auditorium";

    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD = "yes";
  }).nodeDependencies;

in

stdenv.mkDerivation {
  name = "offen-auditorium";
  src = "${offenSrc}/auditorium";
  inherit version;

  buildInputs = [ nodejs ];

  buildPhase = ''
    ADBLOCK=true
    DISABLE_OPENCOLLECTIVE=true
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

    ln -s ${nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${nodeDependencies}/bin:$PATH"

    ln -s ${offenSrc}/banner.txt .
    ln -s ${offenSrc}/locales .
    substituteInPlace gulpfile.js --replace ../banner.txt banner.txt

    NODE_ENV=production
    npm run build
    npm run licenses
  '';

  installPhase = ''
    mkdir -p $out/
    cp -r dist $out/dist
  '';
}
