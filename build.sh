#!/usr/bin/env bash
set -e

mkdir -p output
docker build -t tailor-my-resume-build .
docker run --rm -v "$(pwd)/output:/output" tailor-my-resume-build > /dev/null 2>&1
echo "Done. PDF available at output/resume.pdf"
