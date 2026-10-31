# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.8";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-P+nGchOoy7bVYvYoa6gKn6FmuMbZ9XsuTGH/u1zlcjE=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-u1skigWchTg209+ATvpucWzJ7r3P57prcStWm829vxU=";
  };
}
