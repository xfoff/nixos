{ ... }:
{
  nixpkgs.overlays = [ (self: super: {
    godot_4-mono = super.godot_4-mono.overrideAttrs (old: {
      version = "4.5-dev2";
      src = super.fetchFromGithub {
        owner
      };
    });
  }) ];
}
