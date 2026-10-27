# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.3";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-XdLLVyaBT8gCnO7aWrWs1js3a/0AvKzBerCA7rhVbA8=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-NXRGzMypfRivFgtC+cFP0Nx2TqbbzR7mL0An5Zi/bWA=";
  };
}
