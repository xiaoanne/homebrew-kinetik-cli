require_relative "../lib/custom_download_strategy"

class KinetikCli < Formula
  desc "This is the brew formula to install Kinetik CLI"
  homepage "https://github.com/xiaoanne/kinetik-cli"
  version "0.13.5"
  license "Apache-2.0"
  head "https://github.com/xiaoanne/kinetik-cli", branch: "main"

  on_macos do

    if Hardware::CPU.arm?
        url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin", :using => GithubPrivateRepositoryReleaseDownload
        sha256 "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
        else
        url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-apple-darwin", :using => GithubPrivateRepositoryReleaseDownload
        sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
    end

    def install
        if Hardware::CPU.arm?
          bin.install "kinetik-main-aarch64-apple-darwin" => "kinetik"
        else
          bin.install "kinetik-main-x86_64-apple-darwin" => "kinetik"
        end
        chmod 0755, "#{bin}/kinetik"
        system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
    end
  end

  on_linux do
    url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-unknown-linux-gnu", :using => GithubPrivateRepositoryReleaseDownload
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
    def install
        bin.install "kinetik-main-x86_64-unknown-linux-gnu" => "kinetik"
        chmod 0755, "#{bin}/kinetik"
        system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
    end
  end

  bottle do
    root_url "https://ghcr.io/v2/xiaoanne/kinetik-cli"
  end


  test do
    system "#{bin}/kinetik", "--version"
  end
end
