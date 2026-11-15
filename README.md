# homebrew-tap

Homebrew tap for [macutil](https://github.com/l-castel/macutil) and Copland.

```sh
brew install l-castel/tap/macutil
brew install --cask l-castel/tap/copland
```

## macutil

Builds macutil from source, with the Location helper that lets `macutil-wifi` show WiFi
network names. The cask was removed in 0.4.0. To switch from it:
`brew uninstall --cask macutil && brew install l-castel/tap/macutil`.

## Copland

A terminal-styled Navidrome client for macOS 26 or later. The cask installs the notarized
DMG attached to this repo's `copland-<version>` releases.
