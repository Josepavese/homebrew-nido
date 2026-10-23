class Nido < Formula
  desc "Fast, local QEMU/KVM VM sandboxes for AI agents, with a native MCP server"
  homepage "https://github.com/Josepavese/nido"
  version "4.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "ff9b53161cdc7099f7f06ba6309356947278027d9c5af64c4a9bfa98aa92153c"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "824249f323be5837874ecfdb4107f69b0bb91a7de31908eaf34969b8ebe68eff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "8b9eae15354c9214051545099b3e4a05d78eaecc06e4809a22855bb7d76224a3"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "1d320e1d79d6f67eea44d18dadbe06586fa9ef603697cf077ffcfc8825db0d19"
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
