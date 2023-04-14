require_relative "../lib/custom_download_strategy"

class KinetikCli < Formula
  desc "This is the brew formula to install Kinetik CLI"
  homepage "https://github.com/xiaoanne/homebrew-kinetik-cli"
  version "0.13.6"
  license "Apache-2.0"
  head "https://github.com/xiaoanne/homebrew-kinetik-cli", branch: "main"

  on_macos do

    if Hardware::CPU.arm?
#         url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin", :using => GithubPrivateRepositoryReleaseDownload
#         sha256 "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
        url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.5/kinetik-cli--0.13.5.arm64_monterey.bottle.1.tar.gz"
        sha256 "04f71a4e4f736d7247a934740e91a199111c52522ce5c12854e688edfa154296"
    else
        url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-apple-darwin"
        sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
    end

    def install
        if Hardware::CPU.arm?
          bin.install "0.13.5/bin/kinetik" => "kinetik"
        else
          bin.install "0.13.5/bin/kinetik" => "kinetik"
        end
        chmod 0755, "#{bin}/kinetik"
        system "xattr", "-dr", "com.apple.quarantine", "#{bin}/kinetik"
    end
  end

  on_linux do
    url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.5/kinetik-cli--0.13.5.x86_64_linux.bottle.1.tar.gz"
    sha256 "b8e8078427a79515d33fe5863ea0e8deb915b98d4b3e095f8e228444eb82ba0f"
#     url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-unknown-linux-gnu", :using => GithubPrivateRepositoryReleaseDownload
#     sha256 "4f49bb353d920a01fd4fc3e2689c70f900848c35afb85bc72e2fb683bcb09ffd"
    def install
        bin.install "0.13.5/bin/kinetik" => "kinetik"
        chmod 0755, "#{bin}/kinetik"
    end
  end

  bottle do
    root_url "https://ghcr.io/v2/xiaoanne/kinetik-cli"
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end
