---
name: khong-gian-claude
description: Bỏ nhanh file/folder vào Không gian làm việc Claude Desktop (~/Không gian làm việc Claude Desktop) để Claude đọc/xử lý. Dùng khi Hùng nói "bỏ vô", "bỏ vào workspace", "bỏ cái này cho Claude", "đưa file cho Claude làm", hoặc đưa đường dẫn/tên file kèm ý muốn Claude xử lý nó.
---

# Bỏ vô — đưa file cho Claude làm

Không gian làm việc của Claude Desktop:
**`/Users/<user>/Không gian làm việc Claude Desktop`**
Đây là thư mục DUY NHẤT Claude Desktop (qua MCP Filesystem) đọc/ghi được. Bỏ file vào đây = Claude thấy và xử lý được. Luôn quote đường dẫn khi thao tác shell (có khoảng trắng + dấu).

## Chép vào thư mục con nào
| Loại đồ | Chép vào | Lý do |
|---|---|---|
| File lẻ: tài liệu, ảnh, script, note | `files/` | mặc định |
| Cả một dự án / folder code | `projects/<tên>/` | gom theo dự án |
| Đồ nặng: video, model, dataset lớn (>300MB) | `data/` | `data/` là symlink sang SSD Transcend, đỡ đầy ổ trong |

⚠️ Đồ vào `data/` cần **cắm SSD Transcend** mới đọc được. Rút SSD thì `data/` rỗng.

## Cách làm (Claude tự chạy)
1. Xác định (các) đường dẫn nguồn Hùng đưa. Hùng thường đưa: đường dẫn đầy đủ, tên file trong `~/Downloads`, hoặc kéo-thả file vào chat.
2. Nếu Hùng chỉ đưa tên chưa rõ chỗ → `find ~/Downloads ~/Desktop ~/Documents -maxdepth 3 -iname "*<tên>*"` để tìm, thấy nhiều thì hỏi lại đúng cái nào.
3. Chọn thư mục đích theo bảng trên (nặng thì kiểm tra SSD đã cắm: `ls /Volumes/<drive>` trước).
4. **Chép, không xoá gốc** (an toàn): `cp -R "<nguồn>" "/Users/<user>/Không gian làm việc Claude Desktop/<đích>/"`. Chỉ `mv` (dời hẳn) khi Hùng nói rõ "dời"/"chuyển hẳn".
5. Báo lại: đã bỏ file gì, vào đâu, dung lượng. Rồi hỏi Hùng muốn Claude làm gì với nó.

## Ví dụ
- "bỏ cái file kịch bản trong Downloads vô" → tìm trong ~/Downloads → `cp` vào `files/`.
- "bỏ nguyên folder dự án X vô cho Claude sửa code" → `cp -R` vào `projects/X/`.
- "bỏ mấy video này vô" (file nặng) → kiểm tra SSD → `cp` vào `data/`.

## Nhắc
- Nếu MCP Filesystem đang "failed": mở `~/Library/Application Support/Claude/Claude Extensions Settings/ant.dir.ant.anthropic.filesystem.json`, `allowed_directories` phải trỏ đúng `["/Users/<user>/Không gian làm việc Claude Desktop"]`, rồi Cmd+Q Claude mở lại.
