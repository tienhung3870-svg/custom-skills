---
name: nhan-tin
description: Cỗ máy "2 con Codex nhắn tin cho nhau qua 1 tờ giấy (file)" để làm việc code kiểu 1 bên NGHĨ + 1 bên LÀM. Dùng khi Hùng nói "nhắn tin", "cho 2 con nhắn tin", "cỗ máy <project-c>", "nghĩ rồi làm", "planner/executor", "2 bên chuyên", hoặc muốn 1 con lập kế hoạch rồi con kia thi hành. Code thật ở ~/<project-c>/.
---

# NHẮN TIN — cỗ máy <project-c> (Bản B, nối bằng file)

2 con Codex **nhắn tin cho nhau qua 1 tờ giấy**: con NGHĨ ghi kế hoạch ra file → Hùng duyệt → con LÀM đọc file rồi làm.
Cả 2 đều là Codex (đăng nhập ChatGPT). Nối bằng FILE, KHÔNG dùng MCP → chắc, ít lỗi, xem/duyệt được.

## Khi nào chạy
Hùng muốn giao 1 việc code mà cần "nghĩ kỹ trước, làm sau, có duyệt ở giữa".

## Chạy (3 bước)
```bash
cd ~/<project-c>

# 1) CON NGHĨ lập kế hoạch (chỉ đọc, không sửa file)
./nghi.sh "MÔ TẢ VIỆC CẦN LÀM" /đường/dẫn/project
#    → tạo ke-hoach/MOI-NHAT.md

# 2) HÙNG DUYỆT: mở ke-hoach/MOI-NHAT.md cho Hùng xem, sửa tay nếu cần.
#    (BẮT BUỘC dừng ở đây chờ Hùng OK — đây là chốt an toàn.)

# 3) CON LÀM thi hành đúng kế hoạch
./lam.sh "" /đường/dẫn/project
#    → sửa file + log nhat-ky/LAM-*.log
```

## Sau khi làm
- **TỰ KIỂM bằng lệnh** (chạy thử/đọc file), đừng tin lời con LÀM.
- Báo kết quả cho Hùng.

## Bẫy đã biết
- `codex exec` chạy nền phải thêm `< /dev/null` (không thì treo vì chờ stdin). Script đã lo, nhưng nếu tự gõ tay thì nhớ.
- Con NGHĨ để `PLANNER_EFFORT` cao (`high`) dễ chậm/timeout → mặc định để `medium` trong `config.sh`.

## Chỉnh hành vi
Sửa `~/<project-c>/config.sh` (model, độ nghĩ, thư mục cho phép). Đổi ở đó, khỏi đụng script.

## Guardrail (con LÀM tự chặn)
Chỉ sửa file trong thư mục làm việc; KHÔNG xóa/push/gọi API tốn tiền/gửi mail. Gặp mấy cái đó nó DỪNG và in "CẦN HÙNG DUYỆT TAY".

## Khi lỗi
- Sai lúc nghĩ → mở `ke-hoach/KE-HOACH-*.md`.
- Sai lúc làm → mở `nhat-ky/LAM-*.log`.

## Ghi chú
Có bản A (nối MCP, tự động không cần duyệt) đang phát triển — xem `~/Não bộ/01-du-an/co-may-<project-c>.md`. Hiện B là bản chốt dùng.
