require_relative "lib/custom_download_strategy"
class KinetikCli < Formula
  desc "Kinetik"
  homepage "https://github.com/xiaoanne/homebrew-d3"
  version "0.13.5"
  license "section6nz"
  head "https://github.com/section6nz/kinetik-base", branch: "main"
  if Hardware::CPU.arm?
    # url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.7/kinetik--0.13.5.arm64_monterey.bottle.tar.gz"
    url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin", :using => GitHubPrivateRepositoryDownloadStrategy
    sha256 "ef901473181d1f5c638bf613b54b09ea69e65a6bbaccd2c25e30de25f669e40f"
  else
    url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-apple-darwin"
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
  end
  bottle do
    root_url "https://ghcr.io/v2/section6nz/kinetik-base"
  end

  strategy = GitHubPrivateRepositoryDownloadStrategy.new(
  "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin",
  "kinetik-cli",
  "0.13.5")

  def install
    if Hardware::CPU.arm?
      bin.install "kinetik-main-aarch64-apple-darwi" => "kinetik"
    else
      bin.install "kinetik-main-x86_64-apple-darwin" => "kinetik"
    end
    chmod 0755, "#{bin}/kinetik"
    system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end