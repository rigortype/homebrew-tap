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
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.6/steins-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "9016c4a54d34a7d990d339bb8250200859d3d145dd582487f74dd4762831bfb2"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.6/steins-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "ce1933a35c4b2d5508e04e27ea6f66b98ac3ce8ab1ea1572b5b2b9079f953da2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.6/steins-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c8933ffd3f4a727efaf1f4adfaa320efbca130412618e1643709dcca80cdcf7"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.6/steins-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4c5539ef0b22fa5b13d47ed91b0c49e6ed04838d3e84bc85c1c3104fb533f97"
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
