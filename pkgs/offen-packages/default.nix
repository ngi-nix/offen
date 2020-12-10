{ stdenv, nodejs }:
{ src, version }:

stdenv.mkDerivation {
  name = "offen-packages-source";
  inherit src version;

  buildInputs = [ nodejs ];

  buildPhase = ''
    npm pack
    tar -xvf offen-*.tgz
  '';

  installPhase = ''
    mkdir -p $out/
    cp -r package $out/
  '';
}
