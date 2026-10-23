cask "macutil" do
  version "0.1.0"
  sha256 "e81821d3993b3b0d9324604bf13999023f513575d1dc73b0fc75d702ca49c3e5"

  url "https://github.com/l-castel/macutil/releases/download/v#{version}/Macutil-#{version}-arm64.zip"
  name "macutil"
  desc "WiFi, Bluetooth and Tailscale terminal utilities"
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

  # The app is ad-hoc signed, not notarized, so clear the download quarantine flag.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Macutil.app"], must_succeed: false
  end

  zap trash: "~/.config/macutil"
end
