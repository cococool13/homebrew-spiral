# homebrew-spiral

Homebrew tap for Spiral apps (`Casks/`).

## Build and release rules

- Checks run on this Mac. `just check` before claiming done (same command as pre-push and `ship`); `just check-fast` while working. Never `--no-verify`. Land work only with `.ci/bin/ship`: it checks the exact commit, posts `ci/just-check`, and merges or labels the PR `needs-cohen` (CI, hooks, workflows, release paths). GitHub Actions run nothing here. Merging to main publishes the cask to `brew` users.
