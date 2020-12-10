{ python2, fetchurl, fetchgit, utillinux, runCommand, writeTextFile, stdenv, nodePackages, nodejs, callPackage, offen-packages }@pkgs:
{ src, version }:

let
  nodePackagesRaw = import ./app {
    inherit pkgs nodejs;
    inherit (stdenv.hostPlatform) system;
  };

  nodePackages = nodePackagesRaw.override (old:
    {
      sources = old.sources // {
        "offen-../packages" = old.sources."offen-../packages" // {
          src = "${offen-packages}/package";
        };
      };
    }
  );

in
(builtins.trace nodePackages nodePackages).package.override {
  inherit src;

  postInstall = ''
    npm run build
  '';

  # meta = with lib; {
  #   description = "Offen auditorium";
  #   license = licenses.mit;
  # };
}

# stdenv.mkDerivation {
#   name = "offen-auditorium-source";
#   inherit src version;

#   buildInputs = [ nodejs ];

#   buildPhase = ''
#     echo ${nodeDependencies}
#     # ln -s ${nodeDependencies}/lib/node_modules ./node_modules
#     # export PATH="${nodeDependencies}/bin:$PATH"

#     # echo $PATH
#     # ls -l ./node_modules

#   '';

#   installPhase = ''
#     # mkdir -p $out/
#     # cp -r package $out/
#   '';
# }
