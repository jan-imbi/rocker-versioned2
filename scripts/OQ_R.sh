#!/bin/bash
set -e

# Run R developer-maintained operational tests
R_HOME=""
LANGUAGE="en"
LC_COLLATE="C"
LC_TIME="C"

cd /R-${R_VERSION}
make check-all 2>&1 | tee /R-${R_VERSION}/logs/OQ_base.log



R_HOME=${R_HOME:-/usr/local/lib/R}