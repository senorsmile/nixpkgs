{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.projecteur;
in
{
  options.programs.projecteur = {
    enable = lib.mkEnableOption "projecteur, an application for the Logitech Spotlight device (and similar)";
    package = lib.mkPackageOption pkgs "projecteur" { };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    services.udev.packages = [ cfg.package ];
  };

  meta = {
    maintainers = with lib.maintainers; [
      benneti
      drupol
    ];
  };
}
