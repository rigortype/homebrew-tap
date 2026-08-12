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
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.5/steins-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "bad6ac9df1a0811e61bf84675e123036070255f18809841a00ebcb6b1c3e8fee"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.5/steins-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "c6548a0bfad2f8f292e415ece4741327a17c6bedfa513575389a806b96022138"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rigortype/steins/releases/download/v0.1.5/steins-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a9252d688032376b217700a0435f1b73e033717ca764ecfeaa0d4b077ce94d4"
    end
    on_intel do
      url "https://github.com/rigortype/steins/releases/download/v0.1.5/steins-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f353e4e008831b5dbe42a6372fe97e462bc2e0ebb356ccde4ed151dae0906d9"
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
