{ inputs, ... }:
{
  perSystem = { config, pkgs, lib, ... }: {
    devShells.default = pkgs.mkShell {
      name = "imide-project-template-shell";
      inputsFrom = [
        config.treefmt.build.devShell
      ];

      packages = with pkgs; [
        just
        nixd

        # whatever else
      ];
    };
  };
}
