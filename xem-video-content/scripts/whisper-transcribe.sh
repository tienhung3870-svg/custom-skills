#!/usr/bin/env bash
# whisper-transcribe.sh — Tạo transcript bằng Whisper (OpenAI)
# Usage: whisper-transcribe.sh <video_file> [language] [model]
# Output: .srt + .json cùng thư mục với video
#
# Requires: whisper (pip install openai-whisper), ffmpeg

set -euo pipefail

VIDEO="${1:?Cần truyền đường dẫn video. Usage: whisper-transcribe.sh input.mp4 [language] [model]}"
LANGUAGE="${2:-vi}"
MODEL="${3:-large-v3}"

if [[ ! -f "$VIDEO" ]]; then
  echo "ERROR: File không tồn tại: $VIDEO" >&2
  exit 1
fi

if ! command -v whisper &>/dev/null; then
  echo "ERROR: whisper chưa cài." >&2
  echo "Cài bằng: pip install openai-whisper" >&2
  echo "Hoặc dùng venv: python -m venv ~/.venvs/whisper && source ~/.venvs/whisper/bin/activate && pip install openai-whisper" >&2
  exit 1
fi

OUTPUT_DIR="$(dirname "$VIDEO")"
BASENAME="$(basename "$VIDEO" | sed 's/\.[^.]*$//')"

echo "=== Whisper Transcription ==="
echo "File: $VIDEO"
echo "Model: $MODEL"
echo "Language: $LANGUAGE"
echo "Output dir: $OUTPUT_DIR"
echo "---"

# Chạy Whisper với word-level timestamps
whisper "$VIDEO" \
  --model "$MODEL" \
  --language "$LANGUAGE" \
  --word_timestamps True \
  --output_format all \
  --output_dir "$OUTPUT_DIR" \
  --verbose True

echo "---"
echo "Output files:"
for ext in srt json txt vtt tsv; do
  FILE="$OUTPUT_DIR/$BASENAME.$ext"
  if [[ -f "$FILE" ]]; then
    SIZE=$(stat -f%z "$FILE" 2>/dev/null || stat --printf="%s" "$FILE" 2>/dev/null || echo "?")
    echo "  ✅ $FILE ($SIZE bytes)"
  fi
done

echo ""
echo "⚠️  NHẮC: Whisper output là DRAFT."
echo "    Phải đối chiếu với kịch bản chuẩn, sửa từ nhận sai,"
echo "    và Hùng duyệt trước khi gắn TRANSCRIPT LOCKED."
