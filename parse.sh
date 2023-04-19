#!/bin/bash
# This is a script to parse all projects with an experimental code parse
# 'blark'.

echo "" > parse_results.txt

for path in $(find . -name "*.tsproj"); do
  ls -l $path | tee -a parse_results.txt
  python -m blark parse "$path" 2>&1 | tee -a parse_results.txt
done
