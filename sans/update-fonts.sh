#!/bin/sh

INTER_VERSION=4.1
ARCHIVE=Inter-${INTER_VERSION}.zip
HASH=9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e

BASE_URL=https://github.com/rsms/inter/releases/download/

cd $(dirname $0)
set -e

die() {
  echo "$@" >&2
  exit 1
}

download_source() {
  rm --force "${ARCHIVE}"
  wget "${BASE_URL}/v${INTER_VERSION}/${ARCHIVE}"
  echo "${HASH} ${ARCHIVE}" | \
    sha256sum --check --status || die "${ARCHIVE} has invalid checksum"
}

extract_fonts() {
  unzip -o ${ARCHIVE} InterVariable.ttf InterVariable-Italic.ttf
}

build_font() {
  pyftfeatfreeze \
    --features "cv05" \
    --replacenames "Inter Variable/Adwaita Sans" \
    "${1}" "${2}"
}

download_source
extract_fonts
build_font InterVariable.ttf AdwaitaSans-Regular.ttf
build_font InterVariable-Italic.ttf AdwaitaSans-Italic.ttf
