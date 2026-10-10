#!/usr/bin/env bash
# scene-detect.sh — Tìm điểm chuyển cảnh bằng ffprobe
# Usage: scene-detect.sh <video_file> [threshold]
# Output: danh sách timestamp cho mỗi scene change vượt threshold
#         (score thật không khả dụng qua ffprobe lavfi filter)
#
# Requires: ffprobe (ffmpeg)

set -euo pipefail

VIDEO="${1:?Cần truyền đường dẫn video. Usage: scene-detect.sh input.mp4 [threshold]}"
THRESHOLD="${2:-0.3}"

if [[ ! -f "$VIDEO" ]]; then
  echo "ERROR: File không tồn tại: $VIDEO" >&2
  exit 1
fi

if ! command -v ffprobe &>/dev/null; then
  echo "ERROR: ffprobe chưa cài. Cài ffmpeg trước." >&2
  exit 1
fi

# Lấy tổng thời lượng
DURATION=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$VIDEO")
echo "=== Scene Change Detection ==="
echo "File: $VIDEO"
echo "Duration: ${DURATION}s"
echo "Threshold: $THRESHOLD"
echo "---"
echo "timestamp (vượt threshold=$THRESHOLD)"

# Detect scene changes
ffprobe -v error \
  -show_entries frame=pts_time \
  -of csv=p=0 \
  -f lavfi \
  "movie='$(echo "$VIDEO" | sed "s/'/\\\\'/g")',select='gt(scene\,$THRESHOLD)'" \
  2>/dev/null | while IFS= read -r line; do
    # ffprobe trả về pts_time
    echo "$line"
  done

echo "---"
echo "DONE. Dùng timestamps ở trên làm khung mốc gợi ý cho bảng bóc."
