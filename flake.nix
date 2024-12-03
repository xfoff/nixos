{
  description = "he tried for so long but the people were still retarded";
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      home-manager = {
        url = "github:nix-community/home-manager";
      };
      rose-pine-hyprcursor = {
        url = "github:ndom91/rose-pine-hyprcursor";
      };
      #chaotic = {
        #url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      #};
  };

  outputs = { nixpkgs, self, ... } @inputs:
  let
    system = "x86_64-linux";
    user-inputs = { 
      mainHostname = "iusenixbtw";
      mainUsername = "xfof";
    };
  in
  {
    nixosConfigurations.${user-inputs.mainHostname} = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./modules/default.nix
        #chaotic.nixosModules.default
      ];
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
      };
      specialArgs = { inherit inputs system user-inputs; };
    };
  };
}
