#!/usr/bin/env bash
# Copies the project to a temporary directory, overlays every file in
# Solutions/ on top of Challenges/, and runs the full test suite.
# Use this to prove the tests and reference solutions agree.
#
# Usage: Scripts/verify-solutions.sh [extra xcodebuild args…]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$(mktemp -d "${TMPDIR:-/tmp}/swift-challenges.XXXXXX")"
trap 'rm -rf "$WORK"' EXIT

rsync -a --exclude '.git' --exclude '*.xcodeproj' --exclude 'DerivedData' "$ROOT/" "$WORK/"
rsync -a "$ROOT/Solutions/" "$WORK/Challenges/"

cd "$WORK"
xcodegen generate --quiet
xcodebuild test \
  -project SwiftChallenges.xcodeproj \
  -scheme SwiftChallenges \
  -destination 'platform=macOS' \
  -derivedDataPath "$WORK/DerivedData" \
  "$@"
