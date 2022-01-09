{
  description = "Jason's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = inputs@{ self, nixpkgs, nur, home-manager }: {

    nixosConfigurations = {
      baobab = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          platform.baobab

          trait.base
          trait.fonts
          trait.tools
          trait.torrents
          trait.networking
          trait.window-manager

          user.jason

          home-manager.nixosModules.home-manager
          home.jason

          # { nixpkgs.overlays = [ nur.overlay ]; }
        ];
      };
    };

    nixosModules = {
      platform.baobab = ./platform/baobab.nix;

      trait.base = ./trait/base.nix;
      trait.fonts = ./trait/fonts.nix;
      trait.tools = ./trait/tools.nix;
      trait.torrents = ./trait/torrents.nix;
      trait.networking = ./trait/networking.nix;
      trait.window-manager = ./trait/window-manager.nix;

      user.jason = ./user/jason.nix;
      home.jason = import ./../home-manager;
    };
  };
}
