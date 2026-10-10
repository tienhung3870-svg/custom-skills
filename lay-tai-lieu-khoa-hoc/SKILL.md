---
name: lay-tai-lieu-khoa-hoc
description: Tự động cào tài liệu, bài giảng khóa học từ web/Netlify, làm sạch HTML rác và parse ra Markdown siêu gọn. Tải tự động video khóa học bằng yt-dlp, chuẩn hóa tên file IN HOA CÓ DẤU, và đẩy cuốn chiếu lên Google Drive (drive-tertiary/drive-quaternary) qua rclone để tiết kiệm dung lượng ổ cứng cục bộ.
---

# Hướng dẫn Kỹ năng: Lấy Tài Liệu Khóa Học (lay-tai-lieu-khoa-hoc)

Kỹ năng này phục vụ cho việc lưu trữ, trích xuất và đóng gói các tài liệu học tập, video khóa học (vd: Cường Mê AI) vào kho lưu trữ đám mây của Hùng một cách tối ưu, tự động và không làm đầy SSD.

## Mục tiêu / Outcome
1. **Tài liệu Text/Markdown:** Cào từ các trang web/khóa học (Netlify, web tĩnh), lọc sạch 100% rác HTML (scripts, styles, nav) bằng `BeautifulSoup` + `markdownify`, lưu vào `02-kien-thuc` với chuẩn tên IN HOA CÓ DẤU.
2. **Video:** Tải hàng loạt qua `yt-dlp`. 
3. **Lưu trữ cuốn chiếu:** Đẩy tự động file lên Google Drive (`drive-tertiary` hoặc `drive-quaternary`) thông qua `rclone move` ngay sau mỗi file tải xong để giải phóng ngay dung lượng máy Mac/SSD.

## Quy trình Thực thi (Workflow)

### Bước 1: Tiếp nhận & Phân tích cấu trúc
- Nếu là trang text: Quét DOM, định vị vùng chứa content thật. Bỏ qua header, footer, navigation bar.
- Nếu là danh sách video YouTube/Vimeo: Trích xuất mảng URL.

### Bước 2: Parse Markdown (Cho tài liệu chữ)
- Dùng Python (`bs4` và `markdownify`). 
- Chuyển đổi định dạng, xoá trắng các element thừa. Đóng gói ra file `.md`. Tên file đặt **IN HOA CÓ DẤU** (vd: `CẨM NĂNG WORKFLOW CLAUDE.md`).
- Rclone đẩy vào Drive.

### Bước 3: Cuốn chiếu Video (Cho tài liệu hình ảnh)
- Không bao giờ tải một lúc toàn bộ playlist xuống ổ cứng nội bộ.
- Dùng vòng lặp bash/python:
  1. `yt-dlp [URL]`
  2. Đổi tên file chuẩn "IN HOA CÓ DẤU".
  3. `rclone move [FILE] drive-quaternary:"Kho YouTube dài/[Tên Khóa Học]/"`
  4. Lặp lại cho đến khi hết 100% danh sách.

## Nguyên tắc An toàn
- **CHỈ lấy phần được cấp FREE.** Gặp paywall, "upgrade to access", nội dung khoá sau nút trả phí → **BỎ QUA**, không tìm cách lách, không đăng nhập giả, không dùng tài khoản không phải của Hùng. Không đoán nội dung bị khoá là gì — chỉ ghi nhận "có phần trả phí, đã bỏ qua".
- KHÔNG để file tải về kẹt lại trong `~/Downloads` hoặc `00-vao-nhanh` qua đêm.
- Tên thư mục trên Drive phải gọn gàng, có hệ thống.

## Nghiệm thu (Claude làm, không tin báo cáo)
1. Đếm số mục thật trên site gốc (menu/section) so với số file đã lưu — khớp thì mới OK.
2. Mở vài file mẫu, đối chiếu nội dung với trang gốc (browser pane) — phát hiện rác/sót thì trả lại cho Anti sửa.
3. Xác nhận trên Drive bằng `rclone lsl`, không tin số byte/tên Anti tự báo.

> ⚠️ Bản này từng bị MẤT một lần (2026-08-24) vì chưa commit git — file untracked, không ai để ý xoá lúc nào. Sau khi sửa file này, **commit git ngay trong phiên đó**, không để qua đêm ở trạng thái untracked.

---

## Nhánh 3: Ebook PDF (Anna's Archive → verifier → Drive)

### Nguồn & thứ tự bắt buộc
1. Anna's Archive (annas-archive.gl) → nếu fail → LibGen → Sciarium → dừng + báo

### Bài học kỹ thuật (từ case 001, 2026-09-02)
- **DDoS-Guard chặn headless** (curl/wget/Playwright đều bị block). Phải dùng browser thật (claude-in-chrome MCP). Chờ ~8s sau navigate để JS check qua.
- **Search ISBN thường trả 0 kết quả** với sách mới. Dùng query ngắn: `"Tên sách số level" + lang=en&ext=pdf`. Nếu 2nd edition không có → ghi case fail, không mò Telegram.
- **Slow Partner Server hay đứt giữa chừng.** Dùng `wget -c -q` (resume + quiet). Nếu server #1/#2 đứt → vào lại slow_download page lấy server #3, chờ 20s rồi lấy URL mới.
- **max_chars ≤ 800** khi get_page_text trang search (tránh ngốn context với facet rác).

### Quy trình chuẩn
1. Browser thật → tìm md5 → vào `/slow_download/<md5>/0/1` → chờ 20s → lấy URL
2. `wget -c -q -O ~/Downloads/<tên>/<file>.pdf "<url>"` — nếu đứt thì lấy URL server mới
3. `./verifier.sh <file>` — phải PASS 4 gate
4. `rclone copy <file> "drive-tertiary:KHOÁ HỌC/..."` + `rclone lsl` để confirm
5. Ghi case log theo mẫu trong `cases/`
6. `git add cases/ && git commit -m "case: <tên sách>"`

### verifier.sh — 4 gate
- Gate 1: size > 1MB
- Gate 2: header `%PDF-`
- Gate 3: `pdfinfo` pages > 0
- Gate 4: `file` không phải HTML/text/zip

Script tại: `~/.claude/skills/lay-tai-lieu-khoa-hoc/verifier.sh`
