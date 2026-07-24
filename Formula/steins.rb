# Generated from .github/homebrew/steins.rb.tmpl in rigortype/steins — do not
# edit in the tap. The `homebrew` job in .github/workflows/release.yml fills the
# version, URLs, and per-target sha256 values (read from the `.sha256` sidecars
# uploaded beside each release archive) and commits the result here.
#
# NOTE for editors of the template: the job refuses to push a formula in which
# any substitution token survived, and it detects those by matching an
# at-delimited uppercase word. Do not write such a token into this comment —
# it would survive substitution and fail every release.
class Steins < Formula
  desc "Value-precise static analyzer for PHP that reports only what provably breaks at runtime"
  homepage "https://github.com/rigortype/steins"
  version "0.1.0-rc1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0-rc1/steins-v0.1.0-rc1-aarch64-apple-darwin.tar.gz"
      sha256 "4387e1280cdce9d192751390010631d87bdf79a34e86fb050245ea5953958a70"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0-rc1/steins-v0.1.0-rc1-x86_64-apple-darwin.tar.gz"
      sha256 "7f71c7cde42f48c3f042de506f21023d148cbb9d3b338bb0e124e2a44837e6ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0-rc1/steins-v0.1.0-rc1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3def1fd11b7e4e12d9b4629a01b98f4a01b9f1bd0bdf1ec819e63ec26e4f452"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0-rc1/steins-v0.1.0-rc1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6a0fe1432b1cf35b9eff0de92666aa8a58aa0f996a3008c84c07d3ad478bc3f"
    end
  end

  def install
    # The archive holds the bare binary at its root, beside the notices.
    bin.install "steins"
    doc.install "README.md", "THIRD-PARTY-LICENSES.md"
  end

  # Steins types literals by executing the project's own PHP over IPC, so a
  # brew-installed binary may or may not find a `php` on PATH. `doctor --no-php`
  # sidesteps that: it runs no checks, forces the sound-subset posture, and exits
  # 0 by design (ADR-0054 §10) — a real liveness check with a stable assertion.
  test do
    assert_match "sound subset", shell_output("#{bin}/steins doctor --no-php")
  end
end
