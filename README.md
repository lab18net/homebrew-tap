# lab18net/homebrew-tap

Homebrew formulae for [Lab18](https://github.com/lab18net) software. Bifold's
website: <https://lab18net.github.io/bifold/>.

## Install

```bash
brew install lab18net/tap/bifold        # Bifold, the terminal UI
brew install lab18net/tap/bifold-gui    # Bifold, the desktop window, built from source (macOS)
brew install --cask lab18net/tap/bifold-app   # Bifold.app, prebuilt (Apple silicon)
```

Or tap once and install by name:

```bash
brew tap lab18net/tap
brew install bifold
```

Homebrew asks you to trust third-party taps. Installing by the full name above
trusts that formula; if you tapped first and Homebrew refuses to load a formula,
run `brew trust lab18net/tap`.

| Formula | What | Platforms |
|---|---|---|
| `bifold` | Two-pane file manager for the terminal (`bifold`, `man bifold`) | macOS (tested); Linux is built by this tap's CI, not yet verified |
| `bifold-gui` | The same program as a native window (`bifold-gui`) | macOS |
| `bifold-app` (cask) | The same window as `Bifold.app` in /Applications, prebuilt and ad-hoc signed | macOS, Apple silicon |

Both are built from the tagged source release of
[lab18net/bifold](https://github.com/lab18net/bifold); without a bottle that
means Homebrew's Rust toolchain compiles it on your machine (about a minute).

## Maintainers

The formulae are generated from templates in the Bifold repository
(`packaging/homebrew/`, see its README). A GitHub release of Bifold is picked up
by the daily `brew bump` workflow here, which opens a pull request; the
`brew test-bot` workflow builds and tests bottles on it, and the `brew pr-pull`
workflow publishes them.
