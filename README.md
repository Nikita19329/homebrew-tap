# Nikita19329's Homebrew tap

[![Test](https://github.com/Nikita19329/homebrew-tap/actions/workflows/test.yml/badge.svg)](https://github.com/Nikita19329/homebrew-tap/actions/workflows/test.yml)

Homebrew casks for my apps.

| Cask | App |
|---|---|
| `eyelid` | [Eyelid](https://github.com/Nikita19329/Eyelid), an open-source, Dynamic Island–style notch for MacBooks |

## Eyelid

```sh
brew install --cask nikita19329/tap/eyelid
```

- **Update:** `brew upgrade --cask eyelid`
- **Uninstall:** `brew uninstall --cask eyelid`, or add `--zap` to remove its settings too.

Eyelid isn't notarized by Apple, so macOS blocks its first launch. Allow it in **System Settings → Privacy & Security** with **Open Anyway**.

## How the cask stays current

The [Update Eyelid](.github/workflows/update.yml) workflow checks for a new Eyelid release once a day, and can be started by hand right after a release. Before it updates the cask, it checks the zip against its SHA-256 checksum and against the build provenance attestation from Eyelid's Release workflow, so only builds from that workflow make it into the cask. It then installs and uninstalls the new version on macOS, and pushes the change only if that works.

The [Test](.github/workflows/test.yml) workflow audits the cask and installs and uninstalls it on every change.
