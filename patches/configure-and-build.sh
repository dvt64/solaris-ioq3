#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="${BUILD_DIR:-$ROOT/build}"
SRC="$ROOT"

export PATH="${HOME}/local/bin:${PATH}"

mkdir -p "$BUILD"
cd "$BUILD"

cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_INTERNAL_LIBS=OFF \
  -DUSE_INTERNAL_SDL=OFF \
  -DSDL2_DIR=/usr/lib/amd64/cmake/SDL2 \
  -DUSE_CODEC_OPUS=OFF \
  -DUSE_CODEC_VORBIS=OFF \
  -DUSE_VOIP=OFF \
  -DUSE_MUMBLE=OFF \
  "$SRC"

gmake -j"$(psrinfo | wc -l)"
