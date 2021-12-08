{ config, ... }:
{
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  services.fail2ban = {
    enable = true;
    bantime-increment = {
      enable = true;
    };
  };
}
