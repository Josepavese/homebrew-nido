class Nido < Formula
  desc "Local VM manager for AI agents, with CLI, TUI and native MCP"
  homepage "https://github.com/Josepavese/nido"
  version "4.10.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-arm64.tar.gz"
      sha256 "d9ce3f5937874721bcbe50096573c57d9856e35f16ad3f6f05a6c7e6b71ac36f"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-darwin-amd64.tar.gz"
      sha256 "a2b181390f6e761cf0b933bcef88c01e92863eb07f0606eaa74130b9f0aa3c6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-arm64.tar.gz"
      sha256 "647542e5852bcf638dbbe8d4d592eadab1600683ac34d88d7785866c9ba7f90f"
    else
      url "https://github.com/Josepavese/nido/releases/download/v#{version}/nido-linux-amd64.tar.gz"
      sha256 "a4e8c748c58466e44300a61039074054c0bb4d27b5c870aef49e3648b1117fc9"
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
