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
    ./nixvim/nixvim.nix
    ../../hardware-configuration.nix
    inputs.nixvim.nixosModules.nixvim
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      xfof = import ./home/home.nix;
    };
    backupFileExtension = "backup";
  };
}
