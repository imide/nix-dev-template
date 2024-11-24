{ inputs, ... }:
{
  flake.templates = {
    default = inputs.self.templates.dev;

    dev = {
      description = "a nix flake template for all things development";
      path = builtins.path { path = inputs.self; };
    };
  };
}
