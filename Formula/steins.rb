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
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.2/steins-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "2443c5ba381586b96cb6be770555a41b876df3f1c9c4c933e9d3740c7ecbb597"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.2/steins-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "947dd60ffbfefea1a4ed1fb0d8aa0ac412c6fc15419343b49815fc49d1620620"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.2/steins-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95fecd480bb7e6269da2aaa14d28a37aaad2ba0c6f2d6028f30fa01b745cb9b8"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.2/steins-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be2ae151cad3f129f59aaafc5e07f3636412982bc5e05dc897e79be183a7d5bb"
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
