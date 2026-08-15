class Gloop < Formula
  desc "Foreground Rust CLI for configurable multi-provider agent and command graphs"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "05643ee48f983c3bcf02277d0979d0abbd9b35e9b2c565cac72f5628ced440fa"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Gloop CLI", shell_output("#{bin}/gloop --help")
  end
end
