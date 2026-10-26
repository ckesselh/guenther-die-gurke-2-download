{
  lib,
  stdenvNoCC,
  fetchurl,
  _7zz,
  runtimeShell,
}:

# Günther die Gurke 2 for Macs with Apple Silicon (macOS 14 or newer: nixpkgs' minimum; the app
# itself runs from macOS 13): the app from the disk image in this repo's releases, as released.
# The app is signed ad hoc, and its signature seals every file in the bundle, so the package
# copies it unchanged: no fixup, which would strip and re-sign the Mach-O files. Nix downloads
# the disk image itself, so the app has no quarantine attribute and macOS starts it without
# asking for approval in System Settings.
let
  pname = "guenther-die-gurke-2";
  release = import ./release.nix;
  inherit (release) version;
  app = "Günther die Gurke 2.app";
  exe = "Contents/MacOS/GuentherGurke2";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://github.com/ckesselh/guenther-die-gurke-2-download/releases/download/v${version}/GuentherDieGurke2-v${version}-macos.dmg";
    hash = release.hashes.darwin;
  };

  # 7-Zip, not undmg: undmg writes the „ü“ in the app's name as a control character, 7-Zip keeps
  # the names as they are in the image.
  nativeBuildInputs = [ _7zz ];

  # The image holds a folder with the app, a link to /Applications and HFS+ metadata; only the app
  # is installed. -sns- leaves out extended attributes.
  unpackPhase = ''
    runHook preUnpack
    7zz x -snld -sns- -bso0 -bsp0 -y "$src"
    runHook postUnpack
  '';

  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  # The app goes in under one fixed name, whatever form the image stores „ü“ in; the bundle's own
  # name is not part of its signature. bin/ starts it from a terminal and for `nix run`.
  installPhase = ''
    runHook preInstall
    apps=(*/*.app)
    if [ "''${#apps[@]}" -ne 1 ] || [ ! -x "''${apps[0]}/${exe}" ]; then
      echo "expected one app with ${exe} in the disk image, found: ''${apps[*]}" >&2
      exit 1
    fi
    mkdir -p "$out/Applications" "$out/bin"
    cp -a "''${apps[0]}" "$out/Applications/${app}"
    cat > "$out/bin/${pname}" <<EOF
    #!${runtimeShell}
    exec "$out/Applications/${app}/${exe}" "\$@"
    EOF
    chmod +x "$out/bin/${pname}"
    runHook postInstall
  '';

  meta = {
    description = "Günther die Gurke 2, a German 2D action game: a cucumber strikes back";
    homepage = "https://guenther-die-gurke-2.vercel.app";
    license = lib.licenses.unfree;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = [ "aarch64-darwin" ];
    mainProgram = pname;
  };
}
