---
name: video-workflow
description: Quy trình bóc tách clip mẫu → dựng lại bằng Remotion/React → đóng gói thành skill. Dùng khi làm video motion graphics từ 1 clip tham chiếu (case-001 trở đi). Mỗi video phải chạy đúng workflow trạng thái, brief, style-contract và SKILL.md.
---

# video-workflow — bóc tách clip mẫu → Remotion → skill

> 1 SKILL GỐC (ở `~/Não bộ/skills/video-workflow/`) — rải adapter (symlink) vào Claude/Gemini/Codex/Cursor. KHÔNG copy mỗi nơi 1 bản.

## Mỗi video, agent CHỈ đọc 4 file (không đọc lại toàn bộ Não bộ):
1. **`WORKFLOW-DUNG-VIDEO-SACH.md`** — workflow vận hành duy nhất, bắt buộc đọc trước khi làm.
2. **`brief.md`** — video này làm gì: mục tiêu, độ dài, khung (dọc/ngang), nhạc/BPM, thông điệp.
3. **`style-contract.md`** — thông số riêng của video; thay đổi luật chung chỉ hợp lệ khi Hùng duyệt và ghi rõ tại đây.
4. **`SKILL.md`** (file này) — cách vận hành quy trình.

## Quy trình 5 chặng (chi tiết bắt buộc nằm trong workflow)
1. **Phân tích clip mẫu** → ghi `clip-analysis.md`: chia cảnh theo giây/nhịp, tả từng cảnh (chữ, chuyển động, màu, nhạc). Dò BPM thật (numpy) nếu cần cắt theo beat.
2. **Chốt style-contract** → điền `style-contract.md` từ phân tích (font, màu, nhịp, hiệu ứng).
3. **Dựng bằng Remotion** (`~/<project-d>/remotion/video`): chỉ dựng **một scene**, mở preview thật rồi dừng.
4. **Hùng DUYỆT từng scene**: đạt thì ghi `LOCKED`; chưa đạt chỉ sửa scene hiện tại. Chỉ ghép timeline/render full sau khi tất cả scene đã khóa. Ghi `decision.md` (chọn gì, vì sao).
5. **Đóng skill**: đủ **1 case duyệt thật → skill v0.1**. Đủ **3 case duyệt → mới xây agent chạy nền** (`agent-rollout.md`).

## Tham chiếu (chi tiết đầy đủ)
- `~/Não bộ/01-du-an/QUY-TRINH-BOC-TACH-CLIP-MAU-VA-DONG-GOI-SKILL.md` — quy trình gốc Codex viết.
- `~/Não bộ/01-du-an/case-001-remotion-tu-11-clip/` — case đầu tiên (reference-workflow.md, clip-analysis.md, decision.md, agent-rollout.md).
- `~/<project-d>/remotion/video/` — máy Remotion thật. Comp intro hiện tại: **MoMan** (xem BAN_GIAO_MOMAN09.md). Nhịp thật 136 BPM.

## Luật
- Workflow chuẩn duy nhất: `~/Não bộ/skills/video-workflow/WORKFLOW-DUNG-VIDEO-SACH.md`.
- Mỗi dự án phải có `PROJECT-STATE.md`; agent chỉ làm hành động kế tiếp ghi trong file này.
- KHÔNG dựng lại từ đầu nếu case cũ đã có mẫu — kế thừa contract.
- Video đường dài dựa Remotion (free mãi); AI video chỉ lấy footage.
- Bước tiếp theo (Hùng chốt): áp workflow này vào clip **Motion graphics React/Remotion**.
