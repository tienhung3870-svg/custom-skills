#!/usr/bin/env bash
# verify.sh — Kiểm đầu ra video sau render
# Usage: verify.sh <video_file> [options]
# Options:
#   --expect-duration <seconds>   Thời lượng mong đợi (sai lệch ≤ 2s)
#   --expect-fps <fps>            FPS mong đợi
#   --expect-audio                Bắt buộc có audio track
#   --expect-resolution <WxH>     Resolution mong đợi (vd: 1080x1920)
#
# Exit: 0 = PASS, 1 = FAIL
#
# Requires: ffprobe (ffmpeg)

set -euo pipefail

VIDEO="${1:?Cần truyền đường dẫn video. Usage: verify.sh output.mp4 [options]}"
shift

# Parse options
EXPECT_DURATION=""
EXPECT_FPS=""
EXPECT_AUDIO=false
EXPECT_RESOLUTION=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --expect-duration) EXPECT_DURATION="$2"; shift 2 ;;
    --expect-fps) EXPECT_FPS="$2"; shift 2 ;;
    --expect-audio) EXPECT_AUDIO=true; shift ;;
    --expect-resolution) EXPECT_RESOLUTION="$2"; shift 2 ;;
    *) echo "WARNING: Unknown option: $1" >&2; shift ;;
  esac
done

FAIL_COUNT=0
PASS_COUNT=0

check() {
  local label="$1"
  local result="$2"  # "pass" or "fail"
  local detail="$3"
  
  if [[ "$result" == "pass" ]]; then
    echo "  ✅ $label: $detail"
    PASS_COUNT=$((PASS_COUNT + 1))
  else
    echo "  ❌ $label: $detail"
    FAIL_COUNT=$((FAIL_COUNT + 1))
  fi
}

echo "=== Video Verify ==="
echo "File: $VIDEO"
echo "---"

# 1. File exists and readable
if [[ ! -f "$VIDEO" ]]; then
  echo "  ❌ FILE: Không tồn tại"
  echo "---"
  echo "RESULT: FAIL (1/0)"
  exit 1
fi

FILE_SIZE=$(stat -f%z "$VIDEO" 2>/dev/null || stat --printf="%s" "$VIDEO" 2>/dev/null || echo "0")
if [[ "$FILE_SIZE" -gt 100000 ]]; then
  check "FILE_SIZE" "pass" "${FILE_SIZE} bytes (> 100KB)"
else
  check "FILE_SIZE" "fail" "${FILE_SIZE} bytes (< 100KB — có thể file lỗi)"
fi

# 2. ffprobe readable
if ! command -v ffprobe &>/dev/null; then
  echo "  ❌ FFPROBE: Chưa cài ffprobe"
  echo "---"
  echo "RESULT: FAIL"
  exit 1
fi

PROBE_JSON=$(ffprobe -v error -show_entries format=duration,size:stream=codec_type,codec_name,width,height,r_frame_rate -of json "$VIDEO" 2>/dev/null || true)
HAS_STREAMS=$(echo "$PROBE_JSON" | python3 -c "import sys,json; d=json.load(sys.stdin); print('yes' if ('streams' in d and len(d['streams'])>0) or ('format' in d and 'duration' in d.get('format',{})) else 'no')" 2>/dev/null || echo "no")

if [[ -z "$PROBE_JSON" || "$HAS_STREAMS" != "yes" ]]; then
  check "PROBE" "fail" "ffprobe không đọc được file (file hỏng hoặc sai định dạng)"
  echo "---"
  TOTAL=$((PASS_COUNT + FAIL_COUNT))
  echo "RESULT: ❌ FAIL ($FAIL_COUNT/$TOTAL checks failed)"
  exit 1
fi
check "PROBE" "pass" "ffprobe đọc được"

# 3. Duration (so sánh số thực, không bỏ phần thập phân)
DURATION=$(echo "$PROBE_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin).get('format',{}).get('duration','0'))" 2>/dev/null || echo "0")

if [[ -n "$EXPECT_DURATION" ]]; then
  DURATION_CHECK=$(python3 -c "
dur = float('$DURATION')
exp = float('$EXPECT_DURATION')
diff = dur - exp
abs_diff = abs(diff)
if abs_diff <= 2.0:
    print(f'pass|{dur:.6f}s (expected: {exp}s, diff: {diff:+.6f}s)')
else:
    print(f'fail|{dur:.6f}s (expected: {exp}s, diff: {diff:+.6f}s — sai lệch > 2s)')
" 2>/dev/null || echo "fail|${DURATION}s (expected: ${EXPECT_DURATION}s — lỗi tính toán)")
  
  RESULT_TYPE="${DURATION_CHECK%%|*}"
  DETAIL="${DURATION_CHECK#*|}"
  check "DURATION" "$RESULT_TYPE" "$DETAIL"
else
  IS_VALID=$(python3 -c "print('yes' if float('$DURATION') > 0 else 'no')" 2>/dev/null || echo "no")
  if [[ "$IS_VALID" == "yes" ]]; then
    check "DURATION" "pass" "${DURATION}s"
  else
    check "DURATION" "fail" "Duration = 0 hoặc không đọc được"
  fi
fi

# 4. Video codec
VIDEO_CODEC=$(echo "$PROBE_JSON" | python3 -c "
import sys,json
streams = json.load(sys.stdin)['streams']
for s in streams:
    if s.get('codec_type') == 'video':
        print(s.get('codec_name','unknown'))
        break
" 2>/dev/null || echo "unknown")

if [[ "$VIDEO_CODEC" =~ ^(h264|hevc|h265|vp9|av1)$ ]]; then
  check "VIDEO_CODEC" "pass" "$VIDEO_CODEC"
else
  check "VIDEO_CODEC" "fail" "$VIDEO_CODEC (expected: h264/h265/vp9/av1)"
fi

# 5. Resolution
RESOLUTION=$(echo "$PROBE_JSON" | python3 -c "
import sys,json
streams = json.load(sys.stdin)['streams']
for s in streams:
    if s.get('codec_type') == 'video':
        print(f\"{s.get('width','?')}x{s.get('height','?')}\")
        break
" 2>/dev/null || echo "?x?")

if [[ -n "$EXPECT_RESOLUTION" ]]; then
  if [[ "$RESOLUTION" == "$EXPECT_RESOLUTION" ]]; then
    check "RESOLUTION" "pass" "$RESOLUTION"
  else
    check "RESOLUTION" "fail" "$RESOLUTION (expected: $EXPECT_RESOLUTION)"
  fi
else
  check "RESOLUTION" "pass" "$RESOLUTION"
fi

# 6. FPS
FPS_RAW=$(echo "$PROBE_JSON" | python3 -c "
import sys,json
streams = json.load(sys.stdin)['streams']
for s in streams:
    if s.get('codec_type') == 'video':
        r = s.get('r_frame_rate','0/1')
        parts = r.split('/')
        if len(parts) == 2 and int(parts[1]) > 0:
            print(f'{int(parts[0])/int(parts[1]):.2f}')
        else:
            print(r)
        break
" 2>/dev/null || echo "0")

FPS_INT=${FPS_RAW%.*}

if [[ -n "$EXPECT_FPS" ]]; then
  if [[ "$FPS_INT" -eq "$EXPECT_FPS" ]]; then
    check "FPS" "pass" "${FPS_RAW} (expected: $EXPECT_FPS)"
  else
    check "FPS" "fail" "${FPS_RAW} (expected: $EXPECT_FPS)"
  fi
else
  if [[ "$FPS_INT" -ge 24 ]]; then
    check "FPS" "pass" "${FPS_RAW} (≥ 24)"
  else
    check "FPS" "fail" "${FPS_RAW} (< 24)"
  fi
fi

# 7. Audio track
HAS_AUDIO=$(echo "$PROBE_JSON" | python3 -c "
import sys,json
streams = json.load(sys.stdin)['streams']
for s in streams:
    if s.get('codec_type') == 'audio':
        print(s.get('codec_name','yes'))
        break
else:
    print('none')
" 2>/dev/null || echo "unknown")

if [[ "$HAS_AUDIO" != "none" ]]; then
  check "AUDIO" "pass" "codec: $HAS_AUDIO"
else
  if [[ "$EXPECT_AUDIO" == true ]]; then
    check "AUDIO" "fail" "Không có audio track (bắt buộc có)"
  else
    check "AUDIO" "pass" "Không có audio (không bắt buộc)"
  fi
fi

# Summary
echo "---"
TOTAL=$((PASS_COUNT + FAIL_COUNT))
if [[ "$FAIL_COUNT" -eq 0 ]]; then
  echo "RESULT: ✅ PASS ($PASS_COUNT/$TOTAL checks passed)"
  exit 0
else
  echo "RESULT: ❌ FAIL ($FAIL_COUNT/$TOTAL checks failed)"
  exit 1
fi
