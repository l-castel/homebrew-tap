cask "macutil" do
  version "0.3.0"
  sha256 "995c4b456de0970647cbde0213b4c20b98b67d790edf6d5f2e834d0b453fb276"

  url "https://github.com/l-castel/macutil/releases/download/v#{version}/Macutil-#{version}-arm64.zip"
  name "macutil"
  desc "WiFi, Bluetooth, Tailscale and audio terminal utilities"
  homepage "https://github.com/l-castel/macutil"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Macutil.app"
  binary "#{appdir}/Macutil.app/Contents/MacOS/macutil"
  binary "#{appdir}/Macutil.app/Contents/MacOS/macutil-wifi"
  binary "#{appdir}/Macutil.app/Contents/MacOS/macutil-bt"
  binary "#{appdir}/Macutil.app/Contents/MacOS/macutil-ts"
  binary "#{appdir}/Macutil.app/Contents/MacOS/macutil-audio"

  # The app is ad-hoc signed, not notarized, so clear the download quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Macutil.app"], must_succeed: false
  end

  caveats <<~EOS
    Theme: built-in Tokyo Night, or edit ~/.config/macutil/theme.toml.
    If matugen is installed, the first macutil launch asks whether it may add its
    template to your matugen config (or run: macutil setup-matugen).
  EOS

  zap trash: "~/.config/macutil"
end
