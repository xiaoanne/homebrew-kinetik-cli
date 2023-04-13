require_relative "../lib/custom_download_strategy"

class KinetikCli < Formula
  desc "This is the brew formula to install Kinetik CLI"
  homepage "https://github.com/xiaoanne/kinetik-cli"
  version "0.13.5"
  license "Apache-2.0"
  head "https://github.com/xiaoanne/kinetik-cli", branch: "main"
  bottle do
    root_url "https://ghcr.io/v2/xiaoanne/kinetik-cli"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "33610a18d1461fca4f1f97cf1da0e34d39fdfa533703e21e02b52c6d0f361bda"
    sha256 cellar: :any_skip_relocation, ventura:        "4c5f6d74bfa11bd80715ec22f7711e176faaa0c802f1a0f9aec3845ddc5ce128"
    sha256 cellar: :any_skip_relocation, monterey:       "3df7acb75b45532127e04c953250af82afe1d809612832075443f1a790ad56f3"
    sha256 cellar: :any_skip_relocation, big_sur:        "7a6d01b075fe4a376a79fac7bc6945657ae5b380791ddcf279d4e9f9e987259b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c3e2f0dbf5e56d4d9461cb2140b8e901c838212b8b4d1591fc5194568b7d7a75"
  end

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
