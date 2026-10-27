# The release both packages are built from. The game's release script bumps the version and the
# two hashes after each release (fetchurl checks the flat sha256 of each file).
{
  version = "0.1.4";
  hashes = {
    # GuentherDieGurke2-v<version>-linux-x86_64.AppImage
    linux = "sha256-I6SJtLycAZgvOkDjtJuj/YwClwIMqqUmyWnOe+hwZq0=";
    # GuentherDieGurke2-v<version>-macos.dmg
    darwin = "sha256-UViSAYPGwWiMiT4xdZ23v9Igh8ZqXqYKhc6+tOXdbgo=";
  };
}
