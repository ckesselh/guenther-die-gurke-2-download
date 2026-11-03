# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.2.0";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-ocrJ9+bZTfodbqsk6Otk9yjX4XOn3nWAVp2djker9Hc=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-sbeKRNjOXTukTbqaUJp4R3iQx92M8W7duT5PLhxrQNY=";
  };
}
