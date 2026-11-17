# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.4.0";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-XKJ83lkA4BzPIUTdXIJtlKGpuZMMjynrbkfmTH3vE4I=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-HIHvGmP3ySFVPIWqJ9fsCXa20uQgoog4M2Sh+mgp1zA=";
  };
}
