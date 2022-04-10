{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [
    "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  networking.hostName = "baobab";
  networking.networkmanager.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;

  virtualisation.docker.enable = true;  

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/2EE0-9A18";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0d0cd626-072c-41c0-a988-d255655b56a6";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8aaae0a1-c358-4520-8f81-ad0d838a37d3"; }
  ];
}
