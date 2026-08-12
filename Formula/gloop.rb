class Gloop < Formula
  desc "Foreground Rust CLI for configurable multi-provider agent and command graphs"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "968cf61930c34bf4b1d53a5a8ab99028d7f46a38f27e74ecda90a0dd43ad3938"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Gloop CLI", shell_output("#{bin}/gloop --help")
  end
end
