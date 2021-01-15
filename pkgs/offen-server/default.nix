{ runCommand, buildGoModule, offen-auditorium, offen-vault, statik }:
{ src, version }:

let
  wrappedSrc = runCommand "offen-server-wrapped-src" {} ''
    mkdir -p $out
    cp -r ${src}/server/* $out/
    chmod -R +w $out/public
    cp -r ${src}/locales/* $out/public/
    chmod -R +w $out/public
    cp -r ${offen-auditorium}/dist/* $out/public/
    chmod -R +w $out/public
    cp -r ${offen-vault}/dist/* $out/public/
  '';

in

buildGoModule {
  pname = "offen";
  src = wrappedSrc;
  inherit version;
  vendorSha256 = "1gwbdh521052payig85n0mmcgj3lvm69ym77gkzhj4wabqvfscsp";

  nativeBuildInputs = [ statik ];

  doCheck = false;

  preBuild = ''
    statik -src public
  '';
}
