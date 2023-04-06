require_relative "lib/custom_download_strategy"
class KinetikCli < Formula
  desc "Kinetik"
  homepage "https://github.com/xiaoanne/homebrew-d3"
  version "0.13.5"
  license "section6nz"
  head "https://github.com/xiaoanne/homebrew-d3", branch: "main"
  if Hardware::CPU.arm?
    # url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.7/kinetik--0.13.5.arm64_monterey.bottle.tar.gz"
    url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin", :using => GitHubPrivateRepositoryDownloadStrategy
    sha256 "ef901473181d1f5c638bf613b54b09ea69e65a6bbaccd2c25e30de25f669e40f"
  else
    url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.6/kinetik--0.13.5.x86_64_monterey.bottle.tar.gz"
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
  end
  bottle do
    root_url "https://ghcr.io/v2/xiaoanne/homebrew-d3"
  end

  def install
    strategy = GitHubPrivateRepositoryDownloadStrategy.new(url, name, version)
    strategy.fetch
    if Hardware::CPU.arm?
      bin.install "0.13.5/bin/kinetik" => "kinetik"
    else
      bin.install "0.13.5/bin/kinetik-main-x86_64-apple-darwin" => "kinetik"
    end
    chmod 0755, "#{bin}/kinetik"
    system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end