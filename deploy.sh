#!/usr/bin/env bash
# Deploys ./public to the Cloudflare Pages project "founder-primelab".
# Reads creds from the sibling rpi repo's infra/.env (CLOUDFLARE_API_TOKEN with
# Pages Edit scope, CLOUDFLARE_ACCOUNT_ID), falling back to a local .env.
set -euo pipefail
cd "$(dirname "$0")"

ENV_FILE="../rpi/infra/.env"
[ -f "$ENV_FILE" ] || ENV_FILE=".env"
if [ ! -f "$ENV_FILE" ]; then
  echo "No env file found (looked for ../rpi/infra/.env and ./.env)." >&2
  echo "Need CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID." >&2
  exit 1
fi
set -a
# shellcheck disable=SC1090
. "$ENV_FILE"
set +a

if [ -z "${CLOUDFLARE_API_TOKEN:-}" ] || [ -z "${CLOUDFLARE_ACCOUNT_ID:-}" ]; then
  echo "CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID must be set." >&2
  exit 1
fi

exec npx -y wrangler@latest pages deploy public \
  --project-name founder-primelab \
  --branch main
