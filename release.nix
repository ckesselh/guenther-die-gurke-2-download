# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.2.1";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-dDZpZPTiaz6pajax+lh2I/HKQevbdDNK0LcUJs918QQ=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-kzeQtCx3h0xUH7v4r/enUGrpLZIMmirw1t9XOlT0MQQ=";
  };
}
