# CI contract. Agents, the pre-push hook and `ship` all run `just check`.
# Kit: .ci/ (vendored with ci-sync; `just ci-drift` shows drift).
# This repo had no workflow or hook checks; casks are checked for Ruby syntax.
set shell := ["bash", "-euo", "pipefail", "-c"]

check:
    .ci/bin/ci-par syntax gitleaks

# Changed casks since origin/main plus uncommitted work.
check-fast:
    #!/usr/bin/env bash
    set -euo pipefail
    base="$(git merge-base origin/main HEAD)"
    mapfile -t files < <({ git diff --name-only --diff-filter=d "$base"; git ls-files --others --exclude-standard; } | grep -E '^Casks/.*\.rb$' | sort -u || true)
    if [ "${#files[@]}" -eq 0 ]; then echo "check-fast: no cask changes"; exit 0; fi
    for f in "${files[@]}"; do ruby -c "$f" >/dev/null; done
    echo "check-fast: ${#files[@]} cask(s) ok"

# No formatter is configured (brew style is not a gate here).
fix:
    @echo "fix: no autofixers in this repo"

test: syntax

syntax:
    for f in Casks/*.rb; do ruby -c "$f" >/dev/null; done

# Full history, with the repo's .gitleaks.toml when there is one.
gitleaks:
    gitleaks git --no-banner --redact .

ci-drift:
    .ci/bin/ci-sync --check .
