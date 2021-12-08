{ config, ... }:
{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
