class Nido < Formula
  desc "MCP-native VM manager for AI agents: fast local QEMU/KVM VM sandboxes"
  homepage "https://github.com/Josepavese/nido"
  version "4.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "491654f1df8812d28b3fd50aa68c83b6a063071094a71c14b8c02e72a0555320"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "5db5e33330205e6461bbfc4e310bdc21503c6318b375cbfe0b5564d5ee78c8d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "b9dc85bac5f906959022132f2e8655096fe1962416fbff109ee6825527eeffbb"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "4291818ddf3ea915548f2d0ef96d85d3fbd1971fbb8abe5aa4759b6b2eb385a3"
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
