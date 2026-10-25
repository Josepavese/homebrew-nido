class Nido < Formula
  desc "Local VM manager for AI agents, with CLI, TUI and native MCP"
  homepage "https://github.com/Josepavese/nido"
  version "4.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "0bd06a2e8e8264a8553e0ebdbac8d23730399f6cbfbad01b2971558a6e66fd5b"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "3d8cdf7b81b5f3aad4402ba2221ee5f28ed3cab17a9a20a9e42b6557f8aa54c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "43ae81cf4ee71b64d235b95456654d8afe4ed8b2fdeb2fa5f4db7c6c5969713f"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "8a16c6e8ad45833150c97cedf00dc2e8d15759c671101c8b00219dd6fdbfc727"
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
