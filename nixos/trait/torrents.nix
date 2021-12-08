{ config, ... }:
{
  services.transmission = {
    enable = true;
    settings = {
      "download-dir" = "/home/jason/Downloads";
      "incomplete-dir-enabled" = false;
    };
  };
}
