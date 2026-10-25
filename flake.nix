{
  description = "Günther die Gurke 2: the released game for Linux (x86_64)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      # The release has an AppImage for x86_64 Linux only.
      system = "x86_64-linux";
      # The game is free to play but not open source, so its license is unfree; this flake's own
      # package set allows just the game. The overlay follows the consumer's allowUnfree.
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg: nixpkgs.lib.hasPrefix "guenther-die-gurke-2" (nixpkgs.lib.getName pkg);
      };
    in
    {
      packages.${system} = rec {
        guenther-die-gurke-2 = pkgs.callPackage ./package.nix { };
        default = guenther-die-gurke-2;
      };

      overlays.default = final: _prev: {
        guenther-die-gurke-2 = final.callPackage ./package.nix { };
      };
    };
}
