require_relative "../lib/custom_download_strategy"

class KinetikCli < Formula
  desc "This is the brew formula to install Kinetik CLI"
  homepage "https://github.com/section6nz/homebrew-kinetik-base"
  version "0.13.5"
  license "Apache-2.0"
  head "https://github.com/section6nz/homebrew-kinetik-base", branch: "main"

  on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/xiaoanne/homebrew-kinetik-cli/blob/main/bin/kinetik-main-aarch64-apple-darwin"
        sha256 "888c13d7f869c052883a3a27d3623e0151acec7d8f28c3b1fb1db970395acf5b"
      else
        url "https://github.com/xiaoanne/homebrew-kinetik-cli/blob/main/bin/kinetik-main-x86_64-apple-darwin"
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
    url "https://github.com/xiaoanne/homebrew-kinetik-cli/blob/main/bin/kinetik-main-x86_64-unknown-linux-gnu", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "4f49bb353d920a01fd4fc3e2689c70f900848c35afb85bc72e2fb683bcb09ffd"
    def install
        bin.install "kinetik-main-x86_64-unknown-linux-gnu" => "kinetik"
        chmod 0755, "#{bin}/kinetik"
    end
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end
