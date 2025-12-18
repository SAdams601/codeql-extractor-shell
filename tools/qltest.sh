#!/bin/sh

set -eu

"${CODEQL_DIST}/codeql" database index-files \
    --prune="**/*.testproj" \
    --include-extension=.sh \
    --size-limit=5m \
    --language=shell \
    --working-dir=.\
    "$CODEQL_EXTRACTOR_SHELL_WIP_DATABASE"