#!/usr/bin/env bash
set -eux

LANGUAGE=shell


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  platform="linux64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  platform="osx64"
else
  echo "Unknown OS"
  exit 1
fi

if which codeql >/dev/null; then
  CODEQL_BINARY="codeql"
elif gh codeql >/dev/null; then
  CODEQL_BINARY="gh codeql"
else
  gh extension install github/gh-codeql
  CODEQL_BINARY="gh codeql"
fi

cargo build --release

cargo build --release

mkdir -p "ql/lib/codeql/${LANGUAGE}/ast/internal/"
cargo run --release --bin "codeql-extractor-${LANGUAGE}" -- \
  generate \
  --dbscheme "ql/lib/${LANGUAGE}.dbscheme" \
  --library "ql/lib/codeql/${LANGUAGE}/ast/internal/TreeSitter.qll"

# $CODEQL_BINARY query format -i "ql/lib/codeql/${LANGUAGE}/ast/internal/TreeSitter.qll"

echo "Create extractor pack for $platform"
rm -rf extractor-pack
mkdir -p extractor-pack
cp -r codeql-extractor.yml tools "ql/lib/${LANGUAGE}.dbscheme" "ql/lib/${LANGUAGE}.dbscheme.stats" extractor-pack/

# Tools
mkdir -p extractor-pack/tools/${platform}
cp "target/release/codeql-extractor-${LANGUAGE}" "extractor-pack/tools/${platform}/extractor"
chmod +x extractor-pack/tools/*.sh