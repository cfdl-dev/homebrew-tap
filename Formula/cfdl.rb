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
  version "0.10.1"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-darwin-arm64"
      sha256 "e7c8afca50ab2285a2ecc94fdcb343affbc11acd0178ca7dbbb784a168aee5c3"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-lsp-darwin-arm64"
        sha256 "680c132a8e99d6bba6b0fee4e2a4a12304f0f0612b6ef574cacb4631831115f2"
      end
    end
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-darwin-x64"
      sha256 "c3e729e624b3cb07e63d087458ce90faabe4cddcfdd883a5080d28f213683b8e"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-lsp-darwin-x64"
        sha256 "4f55720393d0dbac73522681d095dfbe29b895b751a0beb24e8cfda399d29f74"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-linux-x64"
      sha256 "8f3cd452c08ada26b29b0609c87c2521c2249fddab12bef6a1ee6766001c11da"
      resource "lsp" do
        url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.1/cfdl-lsp-linux-x64"
        sha256 "be184e74c0463ba130b799e2b27dd03e88375cc3ee59f04a03272fe670a19da9"
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
