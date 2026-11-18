# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.4.2";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-nHjwQkxaL9ap2Di6mSFyNa4OM6zwdgu81JC/4MFrAus=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-Dji4EEBLIjENThIw0UBngwlX2GIDYMEH1OihGFo8xRY=";
  };
}
