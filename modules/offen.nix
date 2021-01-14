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
        Whether to enable the Offen web analytics tool
      '';
    };

    port = mkOption {
      type = types.int;
      default = 8080;
      description = ''
        Port for Offen to listen on
      '';
    };

    # flags = mkOption {
    #   type = with types; attrsOf (nullOr (oneOf [ bool int float str path ]));
    #   default = { };
    #   description = ''
    #     Command line options to pass to offen
    #   '';
    # };
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
          "OFFEN_DATABASE_CONNECTIONSTRING=/var/lib/offen/db.sqlite"
        ];

        ExecStart = "${pkgs.offen}/bin/offen demo";
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
