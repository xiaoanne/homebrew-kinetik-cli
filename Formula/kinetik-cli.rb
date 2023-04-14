require_relative "../lib/custom_download_strategy"

class KinetikCli < Formula
  desc "This is the brew formula to install Kinetik CLI"
  homepage "https://github.com/xiaoanne/homebrew-kinetik-cli"
  version "0.13.8"
  license "Apache-2.0"
  head "https://github.com/xiaoanne/homebrew-kinetik-cli", branch: "main"

  on_macos do

    if Hardware::CPU.arm?
#         url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-aarch64-apple-darwin", :using => GithubPrivateRepositoryReleaseDownload
#         sha256 "8a7a2297d9700747c4d88e2eea9ad349c92ed89aa1c65de27ab088e8d1718650"
        url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.5/kinetik-cli--0.13.5.arm64_monterey.bottle.1.tar.gz"
        sha256 "04f71a4e4f736d7247a934740e91a199111c52522ce5c12854e688edfa154296"
    else
        url "https://github.com/section6nz/kinetik-base/releases/download/v0.13.5/kinetik-main-x86_64-apple-darwin", :using => GithubPrivateRepositoryReleaseDownload
        sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
    end

    def install
        if Hardware::CPU.arm?
          bin.install "0.13.5/bin/kinetik" => "kinetik"
        else
          bin.install "kinetik-main-x86_64-apple-darwin" => "kinetik"
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

#   bottle do
#     root_url "https://ghcr.io/v2/xiaoanne/kinetik-cli"
#   end

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "0fdc50f0e8165ff7de731e092ddfa57149185bd1c1e1cf463e819645364d25ee"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "e823e4d89ae67660af61746c7472d80f0eb2ea70503471ac1190f9c0c691faf0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "eec6c9dd0ae3b32b3d2b22ac4cf926c6b3084a41623361762a4c0a297dc05286"
    sha256 cellar: :any_skip_relocation, ventura:        "1edd59508421089d629ab153c03d9db3c5e0e3cad0a75d3baea36b533a5b1d0a"
    sha256 cellar: :any_skip_relocation, monterey:       "58065a231153b1971495d1d07c7d68740a1e7ca51ff95d8c8684ab511aaa4ab7"
    sha256 cellar: :any_skip_relocation, big_sur:        "588a5ccb517b6d41a4f323f7a376cd9a34e4d0d447baf15179c05fbbf2c0e588"
    sha256 cellar: :any_skip_relocation, catalina:       "1ac1413ef0322b280ae5bd5663373ed959ee54d28dbdd3261fc4da6e57abf44c"
    sha256 cellar: :any_skip_relocation, mojave:         "79ef03b1d334136b693131b133944109545b07aca2dfd9165531016e4250444c"
    sha256 cellar: :any_skip_relocation, high_sierra:    "41223cb51bc006abfba33b6af77b665c28de4155d19e5f43d0561b885b73368f"
    sha256 cellar: :any_skip_relocation, sierra:         "d537cb11d2dcbac9b5d5356c471775699312e83450635ba7676083f381a531cd"
    sha256 cellar: :any_skip_relocation, el_capitan:     "8b805e37fd5f4536b4fbf7f3ae6251b645b4b132027d56ccd015a6036c304744"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f803d33b088e251eba9820706307616a771dea7d2994818a8fc36aca85af0541"
  end

  test do
    system "#{bin}/kinetik", "--version"
  end
end
