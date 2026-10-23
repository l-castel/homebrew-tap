# homebrew-tap

Homebrew tap for [macutil](https://github.com/l-castel/macutil).

```sh
brew tap l-castel/tap

brew install --cask macutil   # app bundle with the Location helper (recommended)
brew install macutil          # command line tools only, built from source (no Location helper: WiFi names are blank)
```

The cask and the formula conflict; install one.
