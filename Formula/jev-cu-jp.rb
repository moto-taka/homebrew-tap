class JevCuJp < Formula
  desc "Choose Computer Use actions with Jev for Japanese and other interfaces"
  homepage "https://github.com/moto-taka/jev-cu-jp"
  url "https://github.com/moto-taka/jev-cu-jp/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4578dbd748c79e20a5dd0ca5a0c08de8bfca5c73330168f105f54dd174262623"
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
