{
  lib,
  appimageTools,
  fetchurl,
  makeDesktopItem,
}:

# Günther die Gurke 2: the released Linux build (the AppImage from this repo's releases), wrapped
# for NixOS. The AppImage bundles the game, the .NET runtime and ICU; appimageTools' default FHS
# environment brings Vulkan, Wayland/X11, PulseAudio/PipeWire and udev (gamepads).
let
  pname = "guenther-die-gurke-2";
  # Bumped together with `hash` by the game's release script after each release.
  version = "0.1.0";

  src = fetchurl {
    url = "https://github.com/ckesselh/guenther-die-gurke-2-download/releases/download/v${version}/GuentherDieGurke2-v${version}-linux-x86_64.AppImage";
    hash = "sha256-GMA0wkNWnCKo14n21e3WM8StaI1dpLLv2hqLr3MPtIY=";
  };

  # The AppImage's own icons (usr/share/icons/hicolor) go into the package.
  contents = appimageTools.extract { inherit pname version src; };

  # Started from the app launcher: fullscreen, native Wayland (Godot falls back to X11 without it).
  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "Günther die Gurke 2";
    genericName = "Action-Jump-'n'-Run";
    comment = "Eine Gurke schlägt zurück";
    exec = "${pname} --display-driver wayland --fullscreen";
    icon = pname;
    terminal = false;
    categories = [
      "Game"
      "ActionGame"
    ];
    keywords = [
      "Günther"
      "Gurke"
      "Spiel"
    ];
    # Godot names the window after the project.
    startupWMClass = "Günther die Gurke 2";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  # On a Wayland compositor without server-side decorations (no xdg-decoration), Godot draws its
  # window frame through libdecor, and a libdecor plugin from the FHS environment hangs the game
  # before the first scene. The game runs fullscreen and needs no frame, so libdecor gets no plugins.
  profile = ''
    export LIBDECOR_PLUGIN_DIR=/var/empty
  '';

  extraInstallCommands = ''
    install -Dm444 ${desktopItem}/share/applications/${pname}.desktop -t $out/share/applications
    mkdir -p $out/share
    cp -r ${contents}/usr/share/icons $out/share/
  '';

  meta = {
    description = "Günther die Gurke 2, a German 2D action game: a cucumber strikes back";
    homepage = "https://guenther-die-gurke-2.vercel.app";
    license = lib.licenses.unfree;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
