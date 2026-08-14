class Gloop < Formula
  desc "Foreground Rust CLI for configurable multi-provider agent and command graphs"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "e2dea00fc1b58a6cfe6fceec90810015a0b790e9ac8d9c8893d322571122dd36"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Gloop CLI", shell_output("#{bin}/gloop --help")
  end
end
