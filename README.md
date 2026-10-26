# Günther die Gurke 2 – Eine Gurke schlägt zurück

Hier liegen die Spieldateien von **Günther die Gurke 2**, einem 2D-Actionspiel auf Deutsch. Jede Version steht unter [Releases](https://github.com/ckesselh/guenther-die-gurke-2-download/releases), mit drei Dateien:

- **Windows:** die Zip-Datei entpacken, dann die .exe im Ordner starten. Das Spiel ist nicht signiert, darum zeigt Windows beim ersten Start „Der Computer wurde durch Windows geschützt“: auf „Weitere Informationen“ klicken, dann „Trotzdem ausführen“.
- **macOS (Apple Silicon):** das Disk-Image öffnen und die App starten. Die App ist nicht von Apple geprüft, darum beim ersten Start Rechtsklick auf die App → „Öffnen“. Ab macOS 15: Systemeinstellungen → Datenschutz & Sicherheit → „Dennoch öffnen“.
- **Linux:** das AppImage ausführbar machen (`chmod +x`) und starten.

Gespielt wird mit Gamepad oder Tastatur.

## Mit Homebrew

Auf einem Mac mit Apple Silicon (ab macOS 13) installiert Homebrew das Spiel in „Programme“:

```sh
brew install --cask ckesselh/tap/guenther-die-gurke-2
```

Neue Versionen holt `brew upgrade`. Beim ersten Start und nach jedem Update hält macOS die App an, weil sie nicht von Apple geprüft ist: die Meldung schließen, dann Systemeinstellungen → Datenschutz & Sicherheit → „Dennoch öffnen“ und mit dem Passwort bestätigen. Unter macOS 14 reicht ein Rechtsklick auf die App → „Öffnen“. Alternativ im Terminal (hebt die Sperre nur für diese App auf):

```sh
xattr -dr com.apple.quarantine "/Applications/Günther die Gurke 2.app"
```

`brew uninstall --cask guenther-die-gurke-2` entfernt das Spiel wieder, mit `--zap` auch die Daten, die es ablegt. Der Cask liegt in [ckesselh/homebrew-tap](https://github.com/ckesselh/homebrew-tap).

## Mit Nix

Unter Linux (x86_64) startet Nix die aktuelle Version direkt:

```sh
nix run github:ckesselh/guenther-die-gurke-2-download
```

Das Paket bringt einen Eintrag fürs Startmenü mit, der das Spiel im Vollbild startet. In einer eigenen Flake-Konfiguration: dieses Repo als Input eintragen und `overlays.default` einbinden, dann gibt es `pkgs.guenther-die-gurke-2` (das Spiel ist kostenlos, aber nicht quelloffen, darum braucht es `allowUnfree`).

Teil 1, [Günther die Gurke](https://guenther-die-gurke.vercel.app), läuft im Browser.
