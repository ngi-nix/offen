{ bundlerEnv, ruby }:

bundlerEnv {
  name = "license_finder";

  inherit ruby;
  gemdir = ./.;
}
