# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.2.2";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-Rep3EGomGbcBnzPOVy14OW3WdCavwVdznNKBB/dgtaY=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-zrP9VnQvVQUY6l3HEe2LHDrhBEjXJLeUBn1mQas978w=";
  };
}
