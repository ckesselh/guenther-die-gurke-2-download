# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.7";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-R8jppAhsW4yKxs4yG8Uw6hat2A0OTlGAz2YfU8Syjxw=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-AUyZDerUp2zJwbu4+ss+E7u5CLWxSERymE7qlCG3K/Y=";
  };
}
