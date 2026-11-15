cask "copland" do
  version "1.0"
  sha256 "d0c08dba8f79450a276d90cbde3337bec4e87bbcc33b7cbcb0f952ce9b9050a9"

  url "https://github.com/l-castel/homebrew-tap/releases/download/copland-#{version}/Copland-#{version}.dmg"
  name "Copland"
  desc "Terminal-styled Navidrome client"
  homepage "https://github.com/l-castel/homebrew-tap"

  depends_on macos: ">= :tahoe"

  app "Copland.app"

  zap trash: [
    "~/Library/Application Scripts/com.lcastel.copland",
    "~/Library/Containers/com.lcastel.copland",
  ]
end
