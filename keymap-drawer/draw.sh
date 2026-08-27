#!/usr/bin/env bash
# Regenerate keymap-drawer/kenkyo.svg from keymap-drawer/kenkyo.yaml.
#
# kenkyo.yaml is hand-maintained, not parsed from kanata/kanata.kbd: keymap-drawer's
# kanata support is experimental and doesn't resolve defchords/deftemplate/defvar, so
# feeding it kanata.kbd directly dumps raw s-expressions as key labels instead of the
# resolved tap/hold behavior. When kanata.kbd's bindings change, update kenkyo.yaml
# to match by hand.
#
# Runs keymap-drawer via uv (no persistent install needed).
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v uvx >/dev/null; then
  echo "error: uv/uvx not found. Install uv (https://docs.astral.sh/uv/) first." >&2
  exit 1
fi

uvx --from keymap-drawer keymap -c draw_config.yaml draw kenkyo.yaml -o kenkyo.svg

echo "==> wrote keymap-drawer/kenkyo.svg"
