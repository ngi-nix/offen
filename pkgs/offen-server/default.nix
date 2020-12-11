{ buildGoModule }:
{ src, version }:

buildGoModule {
  pname = "offen";
  inherit src version;
  vendorSha256 = "1gwbdh521052payig85n0mmcgj3lvm69ym77gkzhj4wabqvfscsp";
}
