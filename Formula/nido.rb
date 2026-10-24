class Nido < Formula
  desc "Local VM manager for AI agents, with CLI, TUI and native MCP"
  homepage "https://github.com/Josepavese/nido"
  version "4.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "93bc05328db905e3033443ff1ae2b1947b37559cc95584cee8783999395be6fb"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "9ed0c5d05411072af5b48b6e36d87f3eb56009c03e60f57f74db08937aab3c25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "a61e6bfc3d3dd344f66c8551cb7f2f36974cad86cf1d6d394b87c05aacd75b49"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "1c9c596445515f19c4b0d93deab6b7de2e0101e2e5d5748181a034537cfbe1f0"
    end
  end

  depends_on "qemu"

  def install
    bin.install "nido"
    bin.install "nido-validator"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nido version")
  end
end
