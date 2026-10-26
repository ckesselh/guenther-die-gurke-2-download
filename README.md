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

Neue Versionen holt `brew upgrade`. Die App ist nicht von Apple notarisiert. Damit sie ohne Freigabe in den Systemeinstellungen startet, entfernt der Cask nach Installation und Update die Quarantäne-Markierung von macOS, nur für diese App. Das ist nicht der von Homebrew empfohlene Weg. Wer das nicht möchte, lädt das Disk-Image direkt herunter und gibt die App beim ersten Start frei (Systemeinstellungen → Datenschutz & Sicherheit → „Dennoch öffnen“).

`brew uninstall --cask guenther-die-gurke-2` entfernt das Spiel wieder, mit `--zap` auch die Daten, die es ablegt. Der Cask liegt in [ckesselh/homebrew-tap](https://github.com/ckesselh/homebrew-tap).

## Mit Nix

Unter Linux (x86_64) und auf einem Mac mit Apple Silicon (ab macOS 14, das setzen die Nix-Pakete voraus) startet Nix die aktuelle Version direkt:

```sh
nix run github:ckesselh/guenther-die-gurke-2-download
```

Beim ersten Start lädt Nix das Spiel herunter, rund 1 GB.

- **Linux:** Das Paket bringt einen Eintrag fürs Startmenü mit, der das Spiel im Vollbild startet.
- **macOS:** Nix lädt das Disk-Image selbst herunter und übernimmt die App unverändert daraus. Weil sie nicht über den Browser kommt, trägt sie keine Quarantäne-Markierung, und macOS startet sie ohne Freigabe in den Systemeinstellungen.

Fest installieren: `nix profile add github:ckesselh/guenther-die-gurke-2-download` (bei älteren Nix-Versionen `nix profile install`), neue Versionen holt `nix profile upgrade --all`. Auf dem Mac liegt die App dann unter `~/.nix-profile/Applications` und startet von dort per Doppelklick. Der Finder blendet diesen Ordner aus: Hin führt „Gehe zu“ → „Gehe zum Ordner …“ (⇧⌘G), im Terminal öffnet ihn `open ~/.nix-profile/Applications`. In „Programme“, und damit auch in die Spotlight-Suche, bringen sie home-manager (`home.packages`, nach `~/Applications/Home Manager Apps`; ab `home.stateVersion = "25.11"`, bei älteren Konfigurationen mit `targets.darwin.copyApps.enable = true`) und nix-darwin (`environment.systemPackages`, nach `/Applications/Nix Apps`).

In einer eigenen Flake-Konfiguration: dieses Repo als Input eintragen und `overlays.default` einbinden, dann gibt es `pkgs.guenther-die-gurke-2`, unter Linux wie auf dem Mac (das Spiel ist kostenlos, aber nicht quelloffen, darum braucht es `allowUnfree`).

Teil 1, [Günther die Gurke](https://guenther-die-gurke.vercel.app), läuft im Browser.
