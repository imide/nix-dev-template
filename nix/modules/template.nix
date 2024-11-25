{ inputs, ... }:
{
  flake.templates = {
    default = inputs.self.templates.nix-dev-template;

    nix-dev-template = {
      description = "a nix flake template for all things development";
      path = builtins.path { path = inputs.self; };
    };
  };
}
