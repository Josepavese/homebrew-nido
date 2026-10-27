class Nido < Formula
  desc "Local VM manager for AI agents, with CLI, TUI and native MCP"
  homepage "https://github.com/Josepavese/nido"
  version "4.10.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "d8ba1cd950a1972eb017e988f1bd312cb0930c6230f7e4e532c5474ab5ebbf44"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "b4253c55311b12803eb1d58741191b87a2284b44cda29ecf31e0c5a05045233e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "61cc6ede7a2a08a2594ca568db6ab0eb3cb27d738b867353fa19506c7a47a5d6"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "f11b9e1a1a57d9ff015744cfb02ca7717aac3eeca7881401b4372833a2503dd8"
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
