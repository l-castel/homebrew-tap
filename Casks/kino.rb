cask "kino" do
  version "1.0,20261116.1243"
  sha256 "c261b4cbdb1625114e7129b2d2f906fd55bc3aadcef68e65a6908187fc36f972"

  url "https://github.com/l-castel/homebrew-tap/releases/download/kino-#{version.csv.first}-#{version.csv.second}/Kino-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Kino"
  desc "Terminal-styled Jellyfin client"
  homepage "https://github.com/l-castel/homebrew-tap"

  # Releases are tagged kino-<version>-<build>; the tap's other releases are macutil's.
  livecheck do
    url :url
    regex(/^kino-(\d+(?:\.\d+)+)-(\d+\.\d+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        match = release["tag_name"]&.match(regex)
        "#{match[1]},#{match[2]}" if match
      end
    end
  end

  depends_on macos: :tahoe

  app "Kino.app"

  zap trash: [
    "~/Library/Application Scripts/com.lcastel.kino",
    "~/Library/Containers/com.lcastel.kino",
  ]
end
