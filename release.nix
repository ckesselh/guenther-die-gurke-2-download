# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.1";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-KZy6T6FpkiODALNi5QOa7371iaqeiTkdY76w5W6sxG4=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-+pTy3s/5Zhj6mvDF+5zJhmJZkSzklZpRvO+hUOrq+SY=";
  };
}
