{ config, lib, pkgs, inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.jason = { pkgs, ... }: {
      xdg.enable = true;

      xdg = {
        enable = true;
        userDirs = {
          enable = true;
          createDirectories = true;
        };
      };

      imports = [
        ./alacritty.nix
        ./firefox.nix
        ./fzf.nix
        ./git.nix
        ./waybar.nix
        ./starship.nix
        ./zathura.nix
        ./zsh.nix
      ];

      home.file.".config/nvim" = {
        source = ./../config/nvim;
        recursive = true;
      };

      home.file.".config/wofi" = {
        source = ./../config/wofi;
        recursive = true;
      };

      home.file.".config/sway" = {
        source = ./../config/sway;
        recursive = true;
      };

      home.file.".config/waybar" = {
        source = ./../config/waybar;
        recursive = true;
      };

      home.packages = with pkgs; [
        blender
        firefox-devedition-bin
        obs-studio
        rustup
        slack
        spotify
        starship
        spotify
        tdesktop
        zola 
      ];
    };

    home-manager.extraSpecialArgs = { inherit inputs; };
  };
}
