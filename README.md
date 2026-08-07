# Spiral — Homebrew tap

Install Spiral apps on a Mac with one command.

```bash
brew install --cask cococool13/spiral/spiral-wallpaper
```

```bash
brew install --cask cococool13/spiral/spiral-slim
```

That's it. Homebrew adds this tap the first time you run one of those, so
there is no separate `brew tap` step. To update later:

```bash
brew upgrade --cask spiral-wallpaper
```

To remove an app and everything it wrote:

```bash
brew uninstall --zap --cask spiral-wallpaper
```

## What's here

| Cask | App | Version |
| --- | --- | --- |
| `spiral-wallpaper` | Spiral Wallpaper — click a wallpaper, it applies | 1.0.3 |
| `spiral-slim` | Spiral Slim — hardens Brave with enterprise policies | 1.0.0 |

Both are Developer ID signed and notarized by Apple, and each cask pins the
SHA-256 published in its release, so Homebrew refuses a file that does not
match.

The apps themselves, their source, and everything else Spiral live in one
repository: **[github.com/cococool13/spiral](https://github.com/cococool13/spiral)**.
This tap only exists because Homebrew requires taps to be their own repository
named `homebrew-*`.

Not on a Mac, or want to read the source first? The
[download page](https://spiral-collection.netlify.app) has direct downloads
for macOS and Windows.
