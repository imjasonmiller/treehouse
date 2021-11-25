{
  description = "Jason's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations = {
      baobab = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          platform.baobab
          trait.base
          user.jason
        ];
      };
    };

    nixosModules = {
      platform.baobab = ./platform/baobab.nix;

      trait.base = ./trait/base.nix;

      user.jason = ./user/jason.nix;
    };
  };
}
