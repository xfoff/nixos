{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  users.users.xfof = {
    isNormalUser = true;
    initialPassword = "123";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "libvirt"
      "kvm"
      "dialout"
      "docker"
    ];
  };
}
