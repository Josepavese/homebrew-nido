class Nido < Formula
  desc "Fast, local QEMU/KVM VM sandboxes for AI agents, with a native MCP server"
  homepage "https://github.com/Josepavese/nido"
  version "4.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "2ba6509d80e1f8a20a20a460fc59b8aa34f6092650ec4b18a0b364c41a357235"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "7c14e2af24b241783bd3a2ccf1dfc86dc20a3107af85c93abba15e293d9f1050"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "3ec0df23731c102cb7b253ee436512894a94ae32fcb87edd43d72d415b4b869b"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "d9b098f9ab8d291de652b7103f79b8e0093a01204daa5d0d1f8df2f5241a8fa2"
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
