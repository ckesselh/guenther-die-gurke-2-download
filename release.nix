# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.2";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-ZaJYCvT7VnKASuiBb20qQ1rt77fNBGR8CTWpj/Je2rQ=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-46PunuIngD0t13gTaD9JrfPOQJaNLXLdjXiK1cWYnUo=";
  };
}
