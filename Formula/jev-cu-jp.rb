class JevCuJp < Formula
  desc "Choose Computer Use actions with Jev for Japanese and other interfaces"
  homepage "https://github.com/moto-taka/jev-cu-jp"
  url "https://github.com/moto-taka/jev-cu-jp/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "418a84662485beb466299a9b263343f74f0153090b3c8368668d58e07c214343"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "package.json", "scripts", "skills", "LICENSE"
    (bin/"jev-cu-jp").write <<~SH
      #!/bin/sh
      JEV_CU_JP_COMMAND="#{opt_bin}/jev-cu-jp" exec "#{formula_opt_bin("node")}/node" "#{opt_libexec}/scripts/cli.mjs" "$@"
    SH
    chmod 0755, bin/"jev-cu-jp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/jev-cu-jp --version").strip
  end
end
