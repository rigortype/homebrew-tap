# homebrew-tap

Homebrew tap for [rigortype](https://github.com/rigortype) tools.

## Install

```sh
brew install rigortype/tap/steins
```

The first `install` taps this repository automatically. Thereafter:

```sh
brew upgrade steins
```

tracks new releases.

## Formulae

- **steins** — value-precise static analyzer for PHP that reports only what
  provably breaks at runtime (CLI).
  Source: <https://github.com/rigortype/steins>
- **lisplens** — token-efficient, polyglot Lisp editing for AI agents (CLI/MCP).
  Source: <https://github.com/rigortype/lisplens>
  **Not published to this tap yet** — see Maintenance.

## Maintenance

Every formula here is generated and pushed automatically by its own project's
release workflow on each `vX.Y.Z` tag — do not edit one by hand.

- `Formula/steins.rb` — [steins release workflow](https://github.com/rigortype/steins/blob/master/.github/workflows/release.yml)
- `Formula/lisplens.rb` — [lisplens release workflow](https://github.com/rigortype/lisplens/blob/master/.github/workflows/release.yml)

A project's `homebrew` job needs the repository secret `HOMEBREW_TAP_TOKEN`, a
token with `contents:write` on this tap — the default `GITHUB_TOKEN` cannot reach
another repository. **When the secret is unset the job skips cleanly: it logs a
warning and exits 0**, so the tool's own release still succeeds and the missing
formula here goes unnoticed unless someone looks.

That is why `lisplens.rb` is absent: lisplens has tagged through v0.6.0 with that
job skipping every time. Setting `HOMEBREW_TAP_TOKEN` on `rigortype/lisplens` and
re-running the `homebrew` job of its latest release adds the formula — no re-tag
needed.
