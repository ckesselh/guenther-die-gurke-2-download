# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.6";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-EQUvnw0ziY/7sn3/fo00AqN2+oFuzqvPCWTZcE03fYU=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-skpH3xPTdVOoYGOV6wI0HM1qACQP8YPMdX6vk/hD/7s=";
  };
}
