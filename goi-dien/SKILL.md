---
name: goi-dien
description: >-
  Chạy cỗ máy Gọi điện (Bản A): một Codex planner gọi Codex executor qua MCP
  để thực hiện một việc code nhỏ, rõ và đã được Hùng duyệt trên đúng một folder.
  Chỉ dùng khi Hùng nói rõ "gọi điện" hoặc "gọi đi" kèm việc cụ thể và đường dẫn
  project. Không tự kích hoạt chỉ vì "làm luôn" hay "tự động". Việc lớn, mơ hồ,
  có xoá/sync/push/chi phí hoặc cần duyệt dùng nhan-tin (Bản B).
---

# Gọi điện — Bản A có chốt phạm vi

## Sự thật về quyền

Lớp planner chạy với `--dangerously-bypass-approvals-and-sandbox`; vì vậy đây là **ủy quyền tự động cho đúng một việc, đúng một thư mục**, không phải quyền chung. Executor lồng vẫn là `workspace-write`, nhưng không coi đó là đủ an toàn.

## Điều kiện để chạy

Chỉ chạy khi đủ cả bốn điều kiện:

1. Hùng nói rõ `gọi điện`/`gọi đi`.
2. Việc có đầu ra kiểm được, ví dụ: “sửa hàm X và test Y”, không phải “sửa cho tốt hơn”.
3. Có đường dẫn project cụ thể, tồn tại; không nhận `/`, home, `~/Não bộ`, hoặc thư mục cha rộng.
4. Không có xoá/di chuyển dữ liệu, push/commit, gửi tin, đăng nhập/credential, thay cấu hình máy, gọi API tốn tiền hay thao tác ngoài project. Có một mục thì dừng và chuyển `nhan-tin` hoặc hỏi Hùng.

Nếu thiếu điều kiện, hỏi đúng phần thiếu. Không tự chọn folder hay tự thu hẹp việc.

## Preflight bắt buộc

Trước khi chạy, kiểm đọc-only:

`project path → tồn tại/đúng loại → git status (nếu có git) → file/test liên quan → lệnh verify dự kiến`.

Sau đó báo một phiếu ngắn:

`GỌI ĐIỆN: việc | project | file dự kiến đụng | lệnh verify | rủi ro còn lại`.

Chỉ khi Hùng trả lời `gọi đi` (hoặc đã gộp chính xác các thông tin này trong yêu cầu ban đầu) mới thực thi.

## Thực thi

```bash
cd ~/<project-c>/goi-dien
./goidien.sh "MÔ TẢ VIỆC CỤ THỂ" "/đường/dẫn/project"
```

- Không thêm `sudo`, không đổi config MCP chung, không sửa `goidien.sh` trong lúc chạy một việc.
- Log ở `~/<project-c>/goi-dien/nhat-ky/GOIDIEN-<timestamp>.log` là bằng chứng tiến trình, không phải bằng chứng kết quả.

## Verify và báo kết quả

Ngay sau lệnh, tự chạy lệnh verify đã chốt (test/lint/chạy file/đọc diff) trong project. Báo tách riêng:

- `Đã sửa`: file và thay đổi đã kiểm.
- `Đã verify`: lệnh + kết quả.
- `Chưa verify/lỗi`: nguyên văn điểm thiếu.

Không nói “xong” chỉ vì agent trả lời xong hoặc log có `completed`.

## Khi không dùng Gọi điện

| Tình huống | Dùng |
|---|---|
| Việc nhỏ, scope rõ, có đường dẫn + verify | `goi-dien` |
| Cần Hùng duyệt kế hoạch hoặc nhiều file/rủi ro | `nhan-tin` |
| Cần phân tích/video/brand trước | skill chuyên môn, rồi mới chọn A/B |

## Chỗ sửa khi lỗi

- Wrapper: `~/<project-c>/goi-dien/goidien.sh`
- Planner MCP: `~/<project-c>/goi-dien/A-home/config.toml`
- Executor home: `~/<project-c>/goi-dien/tay-home/`
- Bản thiết kế và bằng chứng: `~/Não bộ/01-du-an/co-may-<project-c>.md`

Lỗi đã biết: phải có `< /dev/null` để tránh chờ stdin; `codex mcp-server` không nhận `--ignore-user-config`.
