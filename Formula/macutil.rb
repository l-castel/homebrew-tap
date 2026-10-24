class Macutil < Formula
  desc "WiFi, Bluetooth, Tailscale and audio terminal utilities"
  homepage "https://github.com/l-castel/macutil"
  url "https://github.com/l-castel/macutil/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5f4bce92da54cb57b8fe8d631cb640136799e81768692d5935955cc361d1a407"
  license "MIT"
  head "https://github.com/l-castel/macutil.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    %w[launcher wifi bt ts audio].each do |crate|
      system "cargo", "install", *std_cargo_args(path: "crates/#{crate}")
    end
  end

  def caveats
    <<~EOS
      This formula installs the command line tools only. macOS hides WiFi network names
      from processes without Location access, so macutil-wifi will show blank names.
      The cask includes the helper app that fixes this:
        brew uninstall macutil && brew install --cask l-castel/tap/macutil

      Theme: built-in Tokyo Night, or edit ~/.config/macutil/theme.toml.
      If matugen is installed, the first macutil launch asks whether it may add its
      template to your matugen config (or run: macutil setup-matugen).
    EOS
  end

  test do
    %w[macutil macutil-wifi macutil-bt macutil-ts macutil-audio].each do |tool|
      assert_predicate bin/tool, :executable?
    end
  end
end
