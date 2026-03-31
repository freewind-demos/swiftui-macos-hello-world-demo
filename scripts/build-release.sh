#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export DEVELOPER_DIR="${DEVELOPER_DIR:-/Applications/Xcode.app/Contents/Developer}"
cd "$ROOT"
xcodegen generate
rm -rf dist build/ReleaseDerivedData
mkdir -p dist
xcodebuild -project SwiftUIMacOSHelloWorld.xcodeproj \
  -scheme SwiftUIMacOSHelloWorld \
  -configuration Release \
  -derivedDataPath build/ReleaseDerivedData \
  CODE_SIGN_IDENTITY="-" \
  CODE_SIGNING_REQUIRED=NO \
  build
ditto "${ROOT}/build/ReleaseDerivedData/Build/Products/Release/SwiftUIMacOSHelloWorld.app" \
  "${ROOT}/dist/SwiftUIMacOSHelloWorld.app"
echo "Release app: ${ROOT}/dist/SwiftUIMacOSHelloWorld.app"
