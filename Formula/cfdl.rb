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
  version "0.11.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-darwin-arm64"
      sha256 "87eed857f0b4777b55eb3463b70d9c9f38474b01ce43953d09182e86732a111d"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-lsp-darwin-arm64"
        sha256 "d51dc59bc6b32325855a308d647cf8e6822c29204c5cb8a46ce716ad115fb3db"
      end
    end
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-darwin-x64"
      sha256 "e85626360d3afa2dd202ac3a22ffeeab83061ab976de01ddf95971c790d4c6b2"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-lsp-darwin-x64"
        sha256 "af5864245f05182e3efaae686ca7a9fed93c9375e2488cc352cb310af1faa4c7"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-linux-x64"
      sha256 "ada93ef67608337be85b65e8855c3602e928b077aab9a2bff9ec0f897741b9a0"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.11.0/cfdl-lsp-linux-x64"
        sha256 "7a6d08c4175adfd1e276db89e194d24f5d65a9eb00e3038a010f42a7903bfa58"
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
