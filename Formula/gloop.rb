class Gloop < Formula
  desc "Foreground Rust CLI for configurable multi-provider agent and command graphs"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.4.5.tar.gz"
  sha256 "d54458d39bbc8a33df1f5504c66f0ea835fa4e540df8d4f024974ea572823d0d"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Gloop CLI", shell_output("#{bin}/gloop --help")
  end
end
