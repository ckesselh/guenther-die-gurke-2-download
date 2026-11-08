# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.3.0";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-IKOi5shsYbAZkAg93XF74CXS7PfWsFZvoO8RuS+6qgA=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-AqOcRiRejrIFj9GcPjDWAKIdyGEea7qEtfLRtDekgRo=";
  };
}
