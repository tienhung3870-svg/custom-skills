#!/usr/bin/env bash
set -u

FILE="${1:-}"
if [[ -z "$FILE" ]]; then
  echo "FAIL: missing file argument" >&2
  exit 1
fi

if [[ ! -f "$FILE" ]]; then
  echo "FAIL: file does not exist: $FILE" >&2
  exit 1
fi

SIZE=$(stat -c%s "$FILE" 2>/dev/null || stat -f%z "$FILE")
if [[ "$SIZE" -le 0 ]]; then
  echo "FAIL: Gate 1 - empty file" >&2
  exit 1
fi

HEADER=$(head -c 5 "$FILE" | tr -d '\r\n')
if [[ "$HEADER" != "%PDF-" ]]; then
  echo "FAIL: Gate 2 - invalid PDF header" >&2
  exit 1
fi

if command -v pdfinfo >/dev/null 2>&1; then
  if ! pdfinfo "$FILE" >/tmp/pdfinfo.out 2>/tmp/pdfinfo.err; then
    echo "FAIL: Gate 3 - pdfinfo parse failed" >&2
    exit 1
  fi
  PAGES=$(pdfinfo "$FILE" | awk '/Pages:/ {print $2}' | head -n 1)
  if [[ -z "$PAGES" || "$PAGES" =~ ^[0-9]+$ ]] && [[ "$PAGES" -le 0 ]]; then
    echo "FAIL: Gate 3 - zero page PDF" >&2
    exit 1
  fi
else
  echo "FAIL: Gate 3 - pdfinfo not installed" >&2
  exit 1
fi

FILE_TYPE=$(file -b "$FILE")
case "$FILE_TYPE" in
  *HTML*|*text*|*Zip*|*gzip*|*archive*)
    echo "FAIL: Gate 4 - fake or disguised file type: $FILE_TYPE" >&2
    exit 1
    ;;
esac

if grep -qiE 'placeholder|dummy|fake|sample|test page|lorem ipsum|blank page' /tmp/pdfinfo.out /tmp/pdfinfo.err 2>/dev/null; then
  echo "FAIL: Gate 4 - suspicious PDF metadata/content" >&2
  exit 1
fi

echo "PASS: valid PDF ($SIZE bytes, $PAGES pages)"
exit 0
