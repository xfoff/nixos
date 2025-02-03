{
  description = "he tried for so long but the people were still retarded";
  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      home-manager.url = "github:nix-community/home-manager";
      rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
      nixvim.url = "github:nix-community/nixvim/nixos-24.11";
<<<<<<< HEAD
      zen-browser.url = "github:MarceColl/zen-browser-flake";
=======
      zen-browser.url = "github:0xc000022070/zen-browser-flake";
>>>>>>> 107c091 (added all the goodies)
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
      ];
      pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
<<<<<<< HEAD
=======
          config.permittedInsecurePackages = [
            "dotnet-sdk-6.0.428"
          ];
>>>>>>> 107c091 (added all the goodies)
      };
      specialArgs = { inherit inputs system user-inputs; };
    };
  };
}
