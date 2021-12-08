{
  description = "Jason's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }: {

    nixosConfigurations = {
      baobab = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          platform.baobab

          trait.base
          trait.fonts
          trait.networking
          trait.window-manager

          user.jason

          # home-manager.nixosModules.home-manager import ./home-manager
        ];
      };
    };

    nixosModules = {
      platform.baobab = ./platform/baobab.nix;

      trait.base = ./trait/base.nix;
      trait.fonts = ./trait/fonts.nix;
      trait.networking = ./trait/networking.nix;
      trait.window-manager = ./trait/window-manager.nix;

      user.jason = ./user/jason.nix;
    };
  };
}
