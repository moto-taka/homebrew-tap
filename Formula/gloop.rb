class Gloop < Formula
  desc "Foreground Rust CLI for configurable multi-provider agent and command graphs"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "eacbd3a90ddc90a8b48bcc07114ac0a85dd7c48bcc100773b34d046c4163c4a7"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Gloop CLI", shell_output("#{bin}/gloop --help")
  end
end
