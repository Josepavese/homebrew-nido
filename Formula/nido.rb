class Nido < Formula
  desc "Local VM manager for AI agents, with CLI, TUI and native MCP"
  homepage "https://github.com/Josepavese/nido"
  version "4.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "b25b349b8c520f5a915ffb85a0db48c6f2d05562dce81478282ee7e82f0177da"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "807adc391039372355e0fd8165c55030212b39cbbb2d18b4d46b84732d4e0800"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "306dc30a25b0f1fef7fef4a518a25c0cbc421fd3d7a50f66a9bbed6e68a6d7bb"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "dbdeab034942bbda5b2d2e7e848393e2495abbaff11bce7b5dde88606fc2b1b5"
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
