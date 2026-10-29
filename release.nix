# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.5";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-pDlkzZexps9BmX3B1q/qU6NQMTkMnYrRabiMFaszD9U=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-8Ag1g5sECAxlKlYAQBlvnflbcr4ZIboIuYJIMk9A/FU=";
  };
}
