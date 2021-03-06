{ config, pkgs, lib, ... }:
{
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    # Shell utilities
    fd
    feh
    fzf
    git
    htop
    jq
    ripgrep
    tokei
    delta
    # System utilities
    glxinfo
    neovim
    patchelf
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    vulkan-tools
    # Debugging
    gdb
    lldb
    # TODO: Update to below to better work with flakes
    # https://rycee.gitlab.io/home-manager/#sec-flakes-standalone
    home-manager
  ];

  environment = {
    variables = {
      EDITOR = "nvim";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}
