{ inputs, ... }:
{
  imports = [
    inputs.pre-commit-hooks.flakeModule
  ];

  perSystem = { config, self', pkgs, lib, ... }: {
    # Pre-commit hooks here
    pre-commit.settings = {
      hooks = {
        flake-checker.enable = true;
        treefmt.enable = true;

        commitizen.enable = true;
      };
    };
  };
}
