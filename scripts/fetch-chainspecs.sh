#!/usr/bin/env bash
#
# Fetch only the chainspec files referenced by the repo's symlinks, instead of
# cloning entire upstream repositories as git submodules.
#
# Every `chainspec.json` symlink points at submodules/<name>/<path-in-repo>.
# For each one we resolve:
#   - the upstream repo URL  -> from .gitmodules
#   - the pinned commit SHA  -> from the gitlink stored in HEAD's tree
# and download just that single file from raw.githubusercontent.com into the
# location the symlink expects, so the symlink resolves and Jekyll can serve it.
#
# Using the pinned SHA (not a branch) reproduces the exact bytes the submodule
# would have provided, including specs that upstream has since moved or removed.

set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

# submodule path -> "owner/repo"
declare -A REPO_SLUG
while read -r key url; do
  path="${key#submodule.}"; path="${path%.url}"
  slug="${url#https://github.com/}"; slug="${slug%.git}"
  REPO_SLUG["$path"]="$slug"
done < <(git config -f .gitmodules --get-regexp '^submodule\..*\.url$')

# submodule path -> pinned commit SHA (gitlink in the committed tree)
declare -A REPO_SHA
while read -r _mode _type sha path; do
  REPO_SHA["$path"]="$sha"
done < <(git ls-tree HEAD submodules/)

# Build the fetch list: "<destination>\t<raw-url>", one per referenced symlink.
fetch_list="$(mktemp)"
trap 'rm -f "$fetch_list"' EXIT

while IFS= read -r link; do
  target="$(readlink "$link")"
  dest="$(realpath -m --relative-to="$PWD" "$(dirname "$link")/$target")"
  [[ "$dest" == submodules/* ]] || continue

  rest="${dest#submodules/}"
  name="${rest%%/*}"           # e.g. acala
  inpath="${rest#*/}"          # e.g. resources/acala-dist.json
  sub="submodules/$name"

  slug="${REPO_SLUG[$sub]:-}"
  sha="${REPO_SHA[$sub]:-}"
  if [[ -z "$slug" || -z "$sha" ]]; then
    echo "ERROR: no repo/SHA mapping for $sub (referenced by $link)" >&2
    exit 1
  fi

  printf '%s\t%s\n' "$dest" "https://raw.githubusercontent.com/$slug/$sha/$inpath" >> "$fetch_list"
done < <(find . -type l -not -path './.git/*' -not -path './submodules/*' | sort)

# De-duplicate (several symlinks can share one upstream file).
sort -u -o "$fetch_list" "$fetch_list"

count="$(wc -l < "$fetch_list")"
echo "Fetching $count chainspec files (no submodule clone)..."

# Download in parallel; --fail makes any HTTP error a non-zero exit.
fetch_one() {
  local dest="$1" url="$2"
  curl --fail --silent --show-error --location \
       --retry 3 --retry-delay 2 --connect-timeout 30 \
       --create-dirs -o "$dest" "$url" \
    && echo "  ok  $dest" \
    || { echo "  FAIL $dest  <-  $url" >&2; return 1; }
}
export -f fetch_one

if ! xargs -P 16 -d '\n' -a "$fetch_list" -I{} \
       bash -c 'IFS=$'"'"'\t'"'"' read -r d u <<< "{}"; fetch_one "$d" "$u"'; then
  echo "One or more chainspecs failed to download." >&2
  exit 1
fi

echo "Done: $count files fetched."
