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
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.1/steins-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "812d070abd7955da3a44401aea27f2b767f5d8a1cae7902b20a8e9c091aa8d34"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.1/steins-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "39a131854238e42ee8a0574a44f369a4a7e844f298a8b370429e70f6efd84f5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.1/steins-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c238d5c0fe6bcd851d108068b9d85967194680c400e20e8339bad680951c9525"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.1/steins-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83651c2bfa069a2c6f7e9f78fe9cbf01e16c80dc5f54d53419c5836be0bc8dca"
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
