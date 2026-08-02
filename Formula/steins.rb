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
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.3/steins-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "d05f0f7818f13fb456d75f3a127b4941caa0a035b3adb9333eac9cf7d4d7c696"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.3/steins-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "0851cd5bec51ab713e26a43f72168966c2e5386460668abb80121ea31ae2261e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.3/steins-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "652c7cb9cf624df8ff2cd5aab070925111a04fac70d2cf2d7b6d877fe7bcbe52"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.3/steins-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af1e4e9fc5fce1d684b1680836ac268884ea2e39d6874d02b8a88fa23370c211"
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
