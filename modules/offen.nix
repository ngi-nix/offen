{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.services.offen;

in
{
  options.services.offen = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enable the Offen web analytics tool
      '';
    };

    port = mkOption {
      type = types.port;
      default = 8080;
      description = ''
        HTTP port for Offen to listen on
      '';
    };

    extraEnvVars = mkOption {
      type = types.listOf types.str;
      default = [];
      description = ''
        Extra environment variables to configure Offen. Provide a list of
        strings, each containing the definition of an environment variable.

        For example to connect Offen to a local Postgres database:

          [
            "OFFEN_DATABASE_DIALECT=postgres"
            "OFFEN_DATABASE_CONNECTIONSTRING=postgres://user:pass@localhost:5432/offen"
          ]

        For a reference of available settings, see
        https://docs.offen.dev/running-offen/configuring-the-application/
      '';
    };
  };

  config = mkIf cfg.enable {
    systemd.services.offen = {
      wantedBy = [ "multi-user.target" ];

      description = "Offen web analytics";

      serviceConfig = {
        Type = "simple";
        User = "offen";
        Group = "offen";
        StateDirectory = "offen";

        Environment = [
          "OFFEN_SERVER_PORT=${toString cfg.port}"
          "OFFEN_DATABASE_DIALECT=sqlite3"
          "OFFEN_DATABASE_CONNECTIONSTRING=/var/lib/offen/offen.db"
        ] ++ cfg.extraEnvVars;

        ExecStart = "${pkgs.offen}/bin/offen";
      };
    };

    users = {
      users.offen = {
        group = "offen";
        description = "Offen user";
      };

      groups.offen = {};
    };
  };
}
