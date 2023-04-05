class KinetikCli < Formula
  desc "Kinetik"
  homepage "https://github.com/xiaoanne/homebrew-d3"
  version "0.13.5"
  license "section6nz"
  head "https://github.com/xiaoanne/homebrew-d3", branch: "main"
  if Hardware::CPU.arm?
    url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.7/kinetik--0.13.5.arm64_monterey.bottle.tar.gz"
    sha256 "ef901473181d1f5c638bf613b54b09ea69e65a6bbaccd2c25e30de25f669e40f"
  else
    url "https://github.com/xiaoanne/homebrew-d3/releases/download/v1.0.7/kinetik--0.13.5.arm64_monterey.bottle.tar.gz"
    sha256 "1be3b6d1146641dc024f1d79e1e48eb3995eab300f126fe25f54fe8a5098c06e"
  end
  bottle do
    root_url "https://ghcr.io/v2/xiaoanne/homebrew-d3"
    # sha256 cellar: :any_skip_relocation, arm64_ventura:  "b07ab80b2d588ae9ed65d615b8e4f12bf04b8e86eec0ffd407a4955aef9a2dba"
    # sha256 cellar: :any_skip_relocation, arm64_monterey: "f3e01e687a45b2458311702b5b48b8d3bb8d681388cacc85e7fb26d0be6b7720"
    # sha256 cellar: :any_skip_relocation, arm64_big_sur:  "e261303a69440aa46e09bfc3be3b7fb0c5cb6b2a3f6fbeb94338491a8538a90a"
    # sha256 cellar: :any_skip_relocation, ventura:        "cec640c52bce7b9d63223b949ad4e30a96cb1acc58c8f95ab5017104cd41aac6"
    # sha256 cellar: :any_skip_relocation, monterey:       "8c9d9c494114dfcb8c231d5823afa980bd0b7a1d055c30ea7b60a9e4d7a92878"
    # sha256 cellar: :any_skip_relocation, big_sur:        "a010ab98531eaafdb9d35a7f2ca6a0583b6566be603f95b721f41e1037eafacb"
    # sha256 cellar: :any_skip_relocation, catalina:       "6d78f6c36e0933f3c55bc96d4ca5c0e4e24030598702423ed752130721e7b8dc"
    # sha256 cellar: :any_skip_relocation, mojave:         "b3c5d87a9da3f70e3fd16fdf7a3d2327b41c96ab74d62e2a6efa2e3733ec78f3"
    # sha256 cellar: :any_skip_relocation, high_sierra:    "8ca092b6fd5a6ad39e3c91186421bca2943af6bfdbae4ea95254b36d1e109a78"
    # sha256 cellar: :any_skip_relocation, sierra:         "9367a86666aad4d14cecf2d7c20f897d3eb92d5cd913af43081d80b9452e19fd"
    # sha256 cellar: :any_skip_relocation, el_capitan:     "62b4673f4fba1d3c5b201b972e220a2736ec053e0c83b1369bb4e5641a71f8e4"
    # sha256 cellar: :any_skip_relocation, x86_64_linux:   "2129c6039968a818f71997e800575b581128b56f8783eeb32c990f8a5e8b81ad"
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

