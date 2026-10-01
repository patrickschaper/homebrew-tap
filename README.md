# Patrick Schaper's Homebrew tap

Install [MatrixScreenSaver](https://github.com/patrickschaper/matrixScreenSaver),
a native macOS Matrix screen saver. Requires Apple Silicon and macOS 15 (Sequoia)
or newer.

## Install

```bash
brew trust --cask patrickschaper/tap/matrix-screen-saver
brew install --cask patrickschaper/tap/matrix-screen-saver
```

**Security:** this cask automatically removes quarantine from the
checksum-verified screen saver bundle. That bypasses Gatekeeper quarantine
checks; it does not make the bundle notarized or Apple-approved. Install only if
you trust the release publisher.

After installation, open **System Settings > Wallpaper > Screen Saver** and
select **MatrixScreenSaver** manually.

## Migrate a manual installation

An existing bundle is left untouched unless you explicitly allow replacement:

```bash
brew install --cask --force patrickschaper/tap/matrix-screen-saver
```

Only the bundle is replaced; saved options are retained.

## Upgrade or uninstall

```bash
brew upgrade --cask patrickschaper/tap/matrix-screen-saver
brew uninstall --cask patrickschaper/tap/matrix-screen-saver
```

Upgrades do not open settings. Uninstall removes the bundle but retains options.
Successful installs and upgrades print:

> There is no spoon. There is coffee: https://www.buymeacoffee.com/yesman82

## Compatibility and maintenance

The cask uses modern sandboxed install steps, verified with Homebrew 7.0.7,
including developer mode. No deprecated hooks are used.

Release updates use versioned downloads and SHA-256 checksums. Maintainers copy
the generated cask from the screensaver's release handoff, or review an automated
update PR after configuring a dedicated tap-scoped token. Updates are never
automatically merged. See the [maintainer instructions](https://github.com/patrickschaper/matrixScreenSaver/blob/development/Homebrew/README.md).
