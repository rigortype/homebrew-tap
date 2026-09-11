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
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.7/steins-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "9f9c3dbd43bf5a056ed2b20868c0c0b5e54d97a735e9a051c9d46bdca2acbdc6"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.7/steins-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "9ad63a0beaa86d91eef64a5b4d5a86432b12d3c9e42b6d19d1180c61ba5f04a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.7/steins-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1065af0abd0abfa8136c8878a0fc84e1e85821649d26dadb3e0278904058a759"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.7/steins-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68f971414802283150f34dac27cd5d3f754f1a2ebc5b9bc68aedd426319e70d5"
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
