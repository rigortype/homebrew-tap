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
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.8/steins-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "b32ef2ec45b7a3fb7a88753bcdc0654f9fecaeaab19ce23e4a9680dddefd2f0f"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.8/steins-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "3107c3c20a874507e337f53b69fbb66afba10c356a0dfcdad79af6d839deaff6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.8/steins-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38486e9275d5d5eec6f5c8eb8f993544534b3f2ab2f38bba581a08729281bb8b"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.8/steins-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34568956b4a48578675ac82da019ffa5857b39993ebcc050fa3827108350cc7f"
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
