cask "copland" do
  version "1.0,20261116.1118"
  sha256 "8614e66ddd548d631668e27b98c2d59f5a6342be2f837dd3f16abe18becae8a2"

  url "https://github.com/l-castel/homebrew-tap/releases/download/copland-#{version.csv.first}-#{version.csv.second}/Copland-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Copland"
  desc "Terminal-styled Navidrome client"
  homepage "https://github.com/l-castel/homebrew-tap"

  depends_on macos: :tahoe

  app "Copland.app"

  zap trash: [
    "~/Library/Application Scripts/com.lcastel.copland",
    "~/Library/Containers/com.lcastel.copland",
  ]
end
