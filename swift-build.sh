#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

MODE="$(printf '%s' "${1:-debug}" | tr '[:upper:]' '[:lower:]')"
case "$MODE" in
  debug)
    CONFIG="Debug"
    ;;
  release)
    CONFIG="Release"
    ;;
  *)
    echo "usage: ./swift-build.sh [debug|release]" >&2
    exit 2
    ;;
esac

PROJ_NAME="$(awk '/^name:[[:space:]]*/ { print $2; exit }' project.yml)"
if [[ -z "$PROJ_NAME" ]]; then
  echo "error: could not read project name from project.yml" >&2
  exit 1
fi

xcodegen generate

DERIVED="$ROOT/build/DerivedData-$CONFIG"
rm -rf "$DERIVED"

xcodebuild \
  -project "$PROJ_NAME.xcodeproj" \
  -scheme "$PROJ_NAME" \
  -configuration "$CONFIG" \
  -derivedDataPath "$DERIVED" \
  CODE_SIGN_IDENTITY="-" \
  CODE_SIGNING_REQUIRED=NO \
  build

APP_PATH="$DERIVED/Build/Products/$CONFIG/$PROJ_NAME.app"
if [[ ! -d "$APP_PATH" ]]; then
  echo "error: app not found: $APP_PATH" >&2
  exit 1
fi

open "$(dirname "$APP_PATH")"
echo "$APP_PATH"
