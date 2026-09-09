class Gloop < Formula
  desc "Build and run configurable AI workflows"
  homepage "https://github.com/moto-taka/gloop"
  url "https://github.com/moto-taka/gloop/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "a6be43736dbc6cb0933eb9202242c463f82dd9b1941f59eaa56c89b43645af0c"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/gloop-cli"
  end

  test do
    assert_match "Usage: gloop", shell_output("#{bin}/gloop --help")
  end
end
