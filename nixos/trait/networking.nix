{ config, ... }:
{
  programs.gnupg.agent = {
    enable = false;
    enableSSHSupport = true;
  };

  programs.ssh.startAgent = true;

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
