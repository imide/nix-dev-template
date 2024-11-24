{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  perSystem = { config, self', pkgs, lib, ... }: {
    # add formatters and such here

    treefmt.config = {
      projectRootFile = "flake.nix"; # change if needed, flake.nix is always there so
      programs = {
        nixpkgs-fmt.enable = true;
        actionlint.enable = true;

        deadnix = {
          enable = true;
          no-underscore = true;
        };
      };
    };
  };
}
