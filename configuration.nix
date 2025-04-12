{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Argentina/Buenos_Aires";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.gero = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  programs.git.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    kitty
    waybar
    rofi
    obsidian
    pycharm-professional
  ];

  services.openssh.enable = true;

  system.stateVersion = "23.11";
}
