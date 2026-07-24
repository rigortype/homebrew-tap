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
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0/steins-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "2a7aec57a8e67a73c76402865f4d307b4cb52a6b593fad9883dca419b83fced8"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0/steins-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5bee71cec0795b89e9b935aaf7cc0b750a1c7ff17a9a60661c084e59fbce9f49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0/steins-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b16df4f978f6ee36eb725bcfea5a5f112f0a674ab9c0f205ef3aa8e44cd5e63"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.0/steins-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "846a28acedd5ad23c767cdd5019686ef45d21e2352d7634a0d614f91d7cca345"
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
