# Homebrew formula for the CFDL CLI (generated — do not hand-edit).
#
# Produced by distribution/scripts/gen_homebrew.sh from a release's assets and
# shipped beside them as `cfdl.rb`. The placeholders below are filled with the
# tagged version, the download URLs on the public releases repository
# (cfdl-dev/cfdl-releases), and each binary's sha256. Publishing to the tap
# (cfdl-dev/homebrew-tap) is a separate, human-approved step: CI never pushes
# to a tap.
class Cfdl < Formula
  desc "Cash Flow Domain Language — compiler, engine, and CLI"
  homepage "https://cfdl.dev"
  version "0.10.0"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.0/cfdl-darwin-arm64"
      sha256 "8ab7d24bbc5464fd8928a3ed7a9f4194a5834a04e569b275f8c6eb44de0db816"
    end
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.0/cfdl-darwin-x64"
      sha256 "e643b75aabce810f7b59954a188a99f7c0560f7b28498cded8c75ac8b7cfc377"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/cfdl-dev/cfdl-releases/releases/download/v0.10.0/cfdl-linux-x64"
      sha256 "a10dbc0b215a32b90573f5df96a277aaaa19121cfe432d8daff548e3f32af144"
    end
  end

  def install
    # Release assets are bare binaries named per platform; install as `cfdl`.
    bin.install Dir["cfdl-*"].first => "cfdl"
  end

  test do
    assert_match "cfdl", shell_output("#{bin}/cfdl --help 2>&1", 2)
  end
end
