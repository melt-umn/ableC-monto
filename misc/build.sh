#!/bin/bash

set -e

cd "$(dirname ${BASH_SOURCE})"

silver --one-jar -o ableC.jar \
	-I ../../ableC \
	-I ../../extensions/ableC-algebraic-data-types/grammars \
	-I ../../extensions/ableC-cilk/grammars \
	-I ../../extensions/ableC-regex-lib/grammars \
	-I ../../extensions/ableC-regex-pattern-matching/grammars \
	artifact
