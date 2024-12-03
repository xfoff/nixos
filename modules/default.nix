{ inputs, ... }:

{
  imports = [
    ./bootloader.nix
    ./network.nix
    ./sound.nix
    ./packages.nix
    ./users.nix
    ./desktop.nix
    ./graphics.nix
    ./system.nix
    ./disks.nix
    ./keyboard.nix
    ../hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      xfof = import ../home/home.nix;
    };
  };
}
