{ stdenv, nodePackages, nodejs, callPackage }:
{ src, version }:

let
  nodeDependencies = (callPackage ./app {}).shell.nodeDependencies;

in

stdenv.mkDerivation {
  name = "offen-auditorium-source";
  inherit src version;

  buildInputs = [ nodePackages.node2nix ];
  buildPhase = ''
    runHook preBuild


    runHook postBuild
  '';
}
