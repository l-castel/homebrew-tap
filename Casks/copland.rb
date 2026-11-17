cask "copland" do
  version "1.0,20261117.1703"
  sha256 "50e514a42ee6db0975c36ee30a799f87c6ab1be74c8a495f3862be9e27875f3f"

  url "https://github.com/l-castel/homebrew-tap/releases/download/copland-#{version.csv.first}-#{version.csv.second}/Copland-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Copland"
  desc "Terminal-styled Navidrome client"
  homepage "https://github.com/l-castel/homebrew-tap"

  # Releases are tagged copland-<version>-<build>; the tap's other releases are macutil's.
  livecheck do
    url :url
    regex(/^copland-(\d+(?:\.\d+)+)-(\d+\.\d+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        match = release["tag_name"]&.match(regex)
        "#{match[1]},#{match[2]}" if match
      end
    end
  end

  depends_on macos: :tahoe

  app "Copland.app"

  zap trash: [
    "~/Library/Application Scripts/com.lcastel.copland",
    "~/Library/Containers/com.lcastel.copland",
  ]
end
