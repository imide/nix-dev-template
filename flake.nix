{
  description = "imide's nix flake template for all things development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    systems.url = "github:nix-systems/default";

    treefmt-nix.url = "github:numtide/treefmt-nix/main";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";

    # pre-commit
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports =
        let
          modulesDir = ./nix/modules;
        in
        with builtins;
        map (mod: "${modulesDir}/${mod}") (attrNames (readDir modulesDir));
    };

  nixConfig = {
    extra-trusted-public-keys = [ "imide.cachix.org-1:uyhI4TJLoGW6CPD037m0kzfUUff+D+6tQUOU+8YHb8E=" ];
    # Please change this or remove it!!!
    extra-substituters = [ "https://imide.cachix.org" ];
  };
}
