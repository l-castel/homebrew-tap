class Macutil < Formula
  desc "WiFi, Bluetooth and Tailscale terminal utilities"
  homepage "https://github.com/l-castel/macutil"
  url "https://github.com/l-castel/macutil/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ba493f666d8cb87335c4d7dd2454c065d321a2acddab30a925f7f878d56f9abb"
  license "MIT"
  head "https://github.com/l-castel/macutil.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  conflicts_with cask: "macutil"

  def install
    %w[launcher wifi bt ts].each do |crate|
      system "cargo", "install", *std_cargo_args(path: "crates/#{crate}")
    end
  end

  def caveats
    <<~EOS
      This formula installs the command line tools only. macOS hides WiFi network names
      from processes without Location access, so macutil-wifi will show blank names.
      The cask includes the helper app that fixes this:
        brew uninstall macutil && brew install --cask l-castel/tap/macutil
    EOS
  end

  test do
    %w[macutil macutil-wifi macutil-bt macutil-ts].each do |tool|
      assert_predicate bin/tool, :executable?
    end
  end
end
