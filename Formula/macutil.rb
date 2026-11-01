class Macutil < Formula
  desc "WiFi, Bluetooth, Tailscale and audio terminal utilities"
  homepage "https://github.com/l-castel/macutil"
  url "https://github.com/l-castel/macutil/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "50a7ba7e896036582c6cee8ecdb22c4b09b9dbd3fb7b81d1cc3fb10e97dcb51d"
  license "MIT"
  head "https://github.com/l-castel/macutil.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    %w[launcher wifi bt ts audio].each do |crate|
      system "cargo", "install", *std_cargo_args(path: "crates/#{crate}")
    end
    # macOS only reveals WiFi network names to apps with Location access; this helper app
    # holds it. macutil-wifi looks for it in ../libexec.
    system "scripts/make-helper.sh", bin/"macutil-wifi", libexec
  end

  def caveats
    <<~EOS
      WiFi network names need Location access: run macutil-wifi, press s, and allow
      MacutilLocation. macOS asks again after each upgrade.

      Theme: built-in Tokyo Night, or edit ~/.config/macutil/theme.toml.
      If matugen is installed, the first macutil launch asks whether it may add its
      template to your matugen config (or run: macutil setup-matugen).
    EOS
  end

  test do
    %w[macutil macutil-wifi macutil-bt macutil-ts macutil-audio].each do |tool|
      assert_predicate bin/tool, :executable?
    end
    assert_predicate libexec/"MacutilLocation.app/Contents/MacOS/macutil-wifi", :executable?
  end
end
