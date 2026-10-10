---
name: nao-bo
description: >-
  Bộ nhớ ngữ cảnh "Não bộ" của Hùng. Dùng khi bắt đầu phiên (đọc kho để biết
  Hùng là ai, dự án tới đâu, đã vấp gì), khi kết thúc phiên cần ghi nhật ký,
  khi nhắc tới "não", "kho não", "nhật ký", "đẩy não", "bộ nhớ chung" hoặc
  yêu cầu đọc phòng AI khác. Kho chính là
  Obsidian tại ~/Não bộ (file .md, local).
---

# Não bộ — bộ nhớ 2 tầng

Kho CHÍNH: Obsidian `~/Não bộ` (local, .md, trên SSD).
Kho PHỤ: Notion (tóm tắt, xem điện thoại).
⚠️ Đường dẫn có dấu cách + tiếng Việt → luôn bỏ ngoặc kép: `cd ~/"Não bộ"`

## Cấu trúc kho
- `CLAUDE.md` — bộ luật kho, đọc đầu tiên
- `TRANG-THAI.md` — việc đang làm + nợ sống + blocker (ticket DONE ở `archive/`)
- `HUONG-DAN-SU-DUNG.md` — tra cứu nhanh cách dùng
- `00-vao-nhanh/` `01-du-an/` `02-kien-thuc/` `03-nhat-ky/` `archive/`
- `02-kien-thuc/bo-nho-chung-ai/` — bộ nhớ chung đã duyệt + hộp thư đề xuất

## Bộ nhớ chung 3 bot — chỉ dùng theo yêu cầu

Nguồn chuẩn: `~/Não bộ/02-kien-thuc/bo-nho-chung-ai/` trên KINGSTON.

- `APPROVED.md`: dữ kiện/quyết định đã được Hùng chốt.
- `INBOX.md`: đề xuất chưa duyệt; không được dùng như sự thật.
- OpenClaw alias: `~/.openclaw/workspace/shared-memory/`.
- Hermes alias: `~/.hermes/shared-memory/`.

Quy tắc:

1. Không tự động đọc/nhập toàn bộ Discord hoặc phòng của bot khác.
2. Chỉ đọc phòng khác khi Hùng yêu cầu rõ phòng nào; dùng lịch sử đó cho yêu cầu hiện tại, không tự lưu.
3. Chỉ ghi bộ nhớ chung khi Hùng nói rõ `ghi bộ nhớ chung`, `nhớ việc này` hoặc `chốt việc này`.
4. Nội dung chưa được Hùng duyệt phải vào `INBOX.md`; chỉ chuyển sang `APPROVED.md` sau khi Hùng chốt.
5. Cấm lưu token, mật khẩu, mã đăng nhập, API key và transcript thô.
6. KINGSTON không gắn thì fail-closed: báo bộ nhớ chung không khả dụng, không tạo bản thay thế trên ổ Mac.
7. Không tuyên bố bot khác đã nối nếu chưa kiểm chứng runtime và readback thật.

## LUẬT BẮT BUỘC
1. **Đầu phiên:** đọc `TRANG-THAI.md` TRƯỚC (biết việc đang làm + nợ sống), rồi `03-nhat-ky/` (1-2 file gần nhất). Đọc kho TRƯỚC khi hỏi Hùng.
2. **Cuối phiên (hoặc khi Hùng nói "đẩy não"):** ghi 1 file vào `03-nhat-ky/` (YYYY-MM-DD-tieu-de.md) + cập nhật `TRANG-THAI.md` + **QUÉT cả kho gắn ✅ cho mọi file kiến thức chưa có tick** (sửa link kèm) — KHÔNG chờ nhắc, KHÔNG bắt Hùng chỉ từng folder. Chỉ HỎI khi cần XOÁ; giữ nguyên bản gốc/hướng dẫn/backup.
3. **Không gật bừa** — chưa làm thì nói chưa. **Không đoán** — không biết thì hỏi.
4. **HƯỚNG ĐI DÀI, KẾT QUẢ BỀN VỮNG & MỞ ĐƯỜNG FIX** (chốt 2026-08-01, gộp 2026-09-25): Việc gì cũng chọn cách tối ưu nhất, bền nhất (dù cực/lâu); tự quyết không bày nhanh/chậm bắt Hùng chọn. Xây nền dễ mở rộng/bảo trì; lỗi sửa 1 chỗ dứt điểm. Chấp nhận lỗi phát triển, tìm nguyên nhân gốc và mở đường fix; CẤM khuyên "dừng lại", CẤM cầu toàn né việc lớn. Đã duyệt mục tiêu theo tới acceptance live; cấm vá ngắn hạn/pass giả/để sau. "Bằng mọi giá" chỉ trong envelope đã duyệt.
5. **NOTE NGAY + CHẮC CHẮN, KHÔNG ĐOÁN BỪA** (chốt 2026-08-08): Mọi thao tác XOÁ / DI CHUYỂN / THAY ĐỔI dữ liệu thật → BẮT BUỘC note NGAY lúc làm.
6. **Drive 3 kho (chốt 2026-08-14):** 1 OAuth app + 3 remote `drive-primary` / `drive-secondary` / `drive-tertiary` + 3 token Python. Cấm rclone client chung, cấm trộn 3 Gmail, cấm OAuth Testing. Gốc kho: `~/Não bộ/01-du-an/drive-3-kho.md`.
7. **Code/tool/agent — ý tưởng 1, đọc tối thiểu (chốt 2026-09-22):** Với mọi dự án code/tool/agent, làm cho workflow thật, dễ sửa và mở rộng; sách/video là hệ riêng. Trước task chỉ nạp `TRANG-THAI.md`, một nhật ký liên quan nếu cần, `realpath` + Git status/HEAD của đúng repo, rồi đúng file trạng thái/kiến trúc/ticket của task. Không quét cả Não bộ hoặc cả repo để “cho đủ context”. Task phải có mục tiêu, input/output, phạm vi, acceptance, bằng chứng, quyền và budget. Phân biệt file/build/lint/test/chạy thật; không gọi code chết/chồng chéo hoặc xóa/archive patch, backup, worktree khi chưa xác minh reachability, mục đích, owner và rollback. Khi lỗi, tìm nguyên nhân và đường fix; không né việc lớn vì cầu toàn. Mở rộng sau khi một workflow thật và một thay đổi/phục hồi có chủ đích đã được kiểm chứng. Mặc định một executor cho một task.

## Mẫu nhật ký (áp cho MỌI loại việc trong 03-nhat-ky/)
Ghi CÁCH LÀM chi tiết tới mức người lạ dựng lại được, không phải tóm tắt kết quả:

```markdown
## YYYY-MM-DD — tiêu đề việc
### Mục tiêu
### Đã làm gì — từng bước tái lập được (app, file + đường dẫn đầy đủ, lệnh copy chạy được, số liệu thật)
### Vấp gì (kể cả lỗi do AI nói sai)
### Chọn gì, vì sao
### Đang dở (dừng ở file/dòng nào, chờ gì)
```

## Đẩy Notion (tuỳ chọn, chỉ khi Hùng yêu cầu)
```bash
cd ~/<project-a> && source venv/bin/activate
python noi_2_nao.py              # Obsidian → cô đọng → Notion
python nao_tu_don.py "ghi chú"   # nhét thẳng 1 mẩu vào Notion
```

## Ghi chú
Hùng làm kiểu "AI chỉ đường, Hùng tự gõ" với việc mang tính học (đưa 1 bước rồi dừng chờ, nói thẳng, không nhồi nhiều khái niệm cùng lúc); khi Hùng giao việc code/build/fix thì Anti thi công theo Luật 11.
