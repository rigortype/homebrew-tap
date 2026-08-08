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
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.4/steins-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "3d96c318a6b18b520c1a897350665c5ed39ce02fb2e4264c0f61e3d41120b8d1"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.4/steins-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "177fabb3147e3aeabaf42759b2e74766f4d2c4d004d89671c8dcd116f9ab2503"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.4/steins-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3059e1eb062b362640b2981e5f1fd5846e79c57a1a97e5617b275d67afb96f5"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.4/steins-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3b6f6ac5a4050abe5b2ab434fcff7afe046f6aebaa2a695e7ea30fde95be21a"
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
