{ buildGoModule }:
{ src, version }:

buildGoModule {
  pname = "offen";
  inherit src version;
  vendorSha256 = "0phki0cvagd32rsz0pwbgpdgf7vblj515hw20r62g3mfq2qrwlm4";
}
