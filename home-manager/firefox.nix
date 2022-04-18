{ pkgs, ... }:
{
  # nixpkgs.overlays = [ nur.overlay ];

  programs.firefox = {
    enable = false;
    package = pkgs.firefox-devedition-bin;
    # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #   multi-account-containers
    #   ublock-origin
    # ];
    profiles = {
      default = {
        isDefault = true;
        settings = {
          "browser.compactmode.show" = true;
          "dom.webgpu.enabled" = true;
          "extensions.pocket.enabled" = false;
          "gfx.webrender.all" = true;
          "gfx.webrender.enabled" = true;
          "layers.acceleration.force-enabled" = true;
          "layers.force-active" = true;
          "widget.wayland-dmabuf-vaapi.enabled" = true;
        };
      };
    };
  };
}
