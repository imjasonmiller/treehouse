{
  description = "Jason's flake";

  inputs = {
    nixkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations = {
      baobab = {
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
