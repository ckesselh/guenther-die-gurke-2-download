{
  description = "Günther die Gurke 2: the released game for Linux (x86_64) and macOS (Apple Silicon)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      # The release has an AppImage for x86_64 Linux and a disk image for Macs with Apple Silicon.
      packageFor = {
        x86_64-linux = ./package.nix;
        aarch64-darwin = ./package-darwin.nix;
      };
      # The game is free to play but not open source, so its license is unfree; this flake's own
      # package sets allow just the game. The overlay follows the consumer's allowUnfree.
      pkgsFor =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfreePredicate = pkg: lib.hasPrefix "guenther-die-gurke-2" (lib.getName pkg);
        };
    in
    {
      packages = lib.mapAttrs (system: package: rec {
        guenther-die-gurke-2 = (pkgsFor system).callPackage package { };
        default = guenther-die-gurke-2;
      }) packageFor;

      # The Mac app on macOS, the AppImage on Linux; on ARM Linux, Nix refuses it as not available.
      overlays.default = final: _prev: {
        guenther-die-gurke-2 = final.callPackage (
          if final.stdenv.hostPlatform.isDarwin then ./package-darwin.nix else ./package.nix
        ) { };
      };
    };
}
