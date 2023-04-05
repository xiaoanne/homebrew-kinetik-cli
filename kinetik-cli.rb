class KinetikCli < Formula
  desc "Kinetik"
  homepage "https://github.com/xiaoanne/homebrew-d3"
  version "0.13.5"
  license "section6nz"
  head "https://github.com/xiaoanne/homebrew-d3", branch: "main"
  if Hardware::CPU.arm?
    url "https://ghcr.io/xiaoanne/homebrew-d3/kinetik-cli:arm", using: CurlGitHubPackagesDownloadStrategy
    sha256 "9bee0f94b999f08da9b7862f30a953ba8e7c69cfa2b01e4b71260ed874f26fa9"
  else
    url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.6/kinetik--0.13.5.x86_64_monterey.bottle.tar.gz"
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
  end

  def install
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

