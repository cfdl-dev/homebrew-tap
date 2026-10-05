# Homebrew formula for the CFDL CLI and language server (generated — do not hand-edit).
#
# Produced by distribution/scripts/gen_homebrew.sh from a release's assets and
# shipped beside them as `cfdl.rb`. The placeholders below are filled with the
# tagged version, the download URLs on the public releases repository
# (cfdl-dev/cfdl-releases), and each binary's sha256. Publishing to the tap
# (cfdl-dev/homebrew-tap) is a separate, human-approved step: CI never pushes
# to a tap.
class Cfdl < Formula
  desc "Cash Flow Domain Language — compiler, engine, CLI and language server"
  homepage "https://cfdl.dev"
  version "0.12.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-darwin-arm64"
      sha256 "4d2ea6271707801d44f58750de0d737cb40c10cb6a5b1fe59c39a43cd844c476"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-lsp-darwin-arm64"
        sha256 "65fabe7f1d88cab1e278c21533c3013bc0a78b98625b7b02a0c1dd58e93db3ec"
      end
    end
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-darwin-x64"
      sha256 "798d723c88b5337c77139085028259eb7df87640c1c8e282efb4cf54ecf2750d"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-lsp-darwin-x64"
        sha256 "af7ee4904e4497eec92eff7c1def0f88ca330b5f33a177241209800064da79da"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-linux-x64"
      sha256 "cb2175521565c798a084b5ef34f1f337b4884d21f30a559a45f376eef698de42"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.12.0/cfdl-lsp-linux-x64"
        sha256 "3db13cd3e5dbae441ce28f9295f5749a30e6fc7205c17ce1b0f4cb541a64fba8"
      end
    end
  end

  def install
    # Release assets are bare binaries named per platform; install as `cfdl`
    # and `cfdl-lsp`. The editor extension finds `cfdl-lsp` on PATH.
    bin.install Dir["cfdl-*"].first => "cfdl"
    resource("lsp").stage do
      bin.install Dir["cfdl-lsp-*"].first => "cfdl-lsp"
    end
  end

  test do
    assert_match "cfdl", shell_output("#{bin}/cfdl --help 2>&1", 2)
    assert_predicate bin/"cfdl-lsp", :executable?
  end
end
