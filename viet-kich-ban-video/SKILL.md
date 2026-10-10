---
name: viet-kich-ban-video
description: >-
  Viết và hoàn thiện kịch bản video sách/thương hiệu cá nhân của Hùng: nghiên
  cứu có bằng chứng, tạo ba hướng/bản nháp bằng DeepSeek, GLM hoặc Ollama,
  cho Hùng chọn, chuyển qua Claude subscription duyệt thủ công, rồi mới chốt
  kịch bản và chia scene. Dùng khi Hùng nhắc "viết kịch bản", "làm content",
  "pipeline content", "ba bản nháp", "Claude duyệt", "script video sách",
  hoặc cần biến một ý sách/chủ đề thành video ngắn.
---

# Viết kịch bản video

Skill duy nhất cho phần **ý tưởng -> nghiên cứu -> kịch bản -> duyệt -> chia scene**.
Không tạo hoặc gọi thêm skill `/lam-content` trùng chức năng.

## Nguồn chuẩn phải đọc

- Công thức sống: `/Users/<user>/Não bộ/02-kien-thuc/CONG-THUC-KICH-BAN-VIDEO.md`
- Pipeline tự động: `/Users/<user>/<project-d>/workflow/CONTENT-PIPELINE.md`
- Prompt chia scene: `/Users/<user>/Não bộ/01-du-an/case-004-anndaynee/PROMPT-CHIA-SCENE.md`

Đọc công thức sống trước khi viết. Khi chạy tự động, đọc thêm tài liệu pipeline và kiểm tra code hiện tại; file sống luôn ưu tiên hơn nội dung tóm tắt trong skill.

## Gate 0 — không đoán, không tự tiêu tiền

Trước khi viết phải biết tối thiểu: chủ đề/cuốn sách, ý chính và thời lượng mong muốn. Nếu thiếu yếu tố làm đổi hướng nội dung, hỏi Hùng.

- Không bịa số liệu, nguồn, câu trích hoặc câu chuyện khách hàng.
- Claim chưa kiểm chứng phải ghi `CHƯA KIỂM CHỨNG`.
- Không gọi API trả phí nếu Hùng chưa cho phép ở lần chạy đó.
- Không tự fallback provider; lỗi thì dừng và báo đúng lỗi.
- Claude subscription là cổng duyệt thủ công; không tự gọi Claude API.

## Chọn chế độ

### Viết cùng Hùng trong chat

Dùng khi Hùng chỉ yêu cầu lên ý hoặc viết kịch bản. Làm theo công thức sống, đưa các phương án ngắn để Hùng chọn, rồi sửa đến khi Hùng duyệt. Không cần chạy pipeline hay API.

### Chạy pipeline tự động

Chỉ chạy khi Hùng yêu cầu rõ. Pipeline gốc: `/Users/<user>/<project-d>/workflow/run_pipeline.py`.

- `deepseek`: API chính; có tính phí và cần Hùng cho phép.
- 💰 **Giờ rẻ API (off-peak) — áp khi chạy LƯỢNG LỚN / batch nhiều bản:** DeepSeek tính giá thấp điểm rẻ hơn nhiều. Từ 23/8/2026: **cuối tuần (T7+CN, giờ Bắc Kinh) rẻ CẢ NGÀY**; ngày thường giá rẻ rơi vào **khuya** (giờ VN ~23:30–07:30). → Sinh nhiều video / nhiều bản nháp một lượt thì **hẹn chạy cuối tuần hoặc khuya** cho rẻ. Còn 1 bản nháp lẻ cần gấp thì cứ chạy, khỏi chờ. (Con agent chat real-time KHÔNG áp luật này — phải rep bất kỳ lúc nào.)
- `glm`: API thay thế khi Hùng chọn GLM.
- `ollama`: local, không tốn API nhưng máy phải bật Ollama.

Chạy từ `/Users/<user>/<project-d>/workflow`:

```bash
python3 run_pipeline.py --topic "CHU_DE" --provider deepseek
python3 run_pipeline.py --topic "CHU_DE" --provider glm
python3 run_pipeline.py --topic "CHU_DE" --provider ollama
```

Luồng bắt buộc:

1. `researcher.py` thu thập nền và bằng chứng.
2. `copywriter.py` tạo đúng ba bản nháp khác góc tiếp cận.
3. Dừng để Hùng chọn/sửa một bản.
4. Xuất `claude_review_packet.md`; dừng để Hùng gửi qua Claude subscription.
5. Chỉ nhận lại JSON đã duyệt thật thành `claude_approved.json`.
6. Hùng cho phép tiếp thì mới chạy `python3 run_pipeline.py --finalize claude_approved.json`.

### Chia scene để dựng

Chỉ làm sau khi Hùng duyệt kịch bản cuối. Ghép đúng một kịch bản vào prompt chia scene, không dán chồng prompt; sau đó chuyển sang `/ky-nang-edit`.

## Chuẩn đầu ra

1. Chào thương hiệu + hứa giá trị/thời lượng.
2. Nêu vấn đề và hook có gài tò mò.
3. Các ý theo nhịp **Ý sách -> bằng chứng thật -> câu chạm cảm xúc**.
4. Ngôn ngữ nói tự nhiên, xưng "bạn", không văn mẫu và không kể lại sách.
5. CTA tương tác trước teaser phần sau.
6. Ước lượng thời lượng đọc; dài hơn mục tiêu thì cắt trước khi chia scene.

## Cổng chất lượng

- Đúng công thức sống và đúng giọng thương hiệu của Hùng.
- Số liệu/trích dẫn có nguồn hoặc được đánh dấu chưa kiểm chứng.
- Ba bản nháp phải khác góc, không chỉ thay vài chữ.
- Bản Claude trả về chưa phải bản cuối nếu Hùng chưa duyệt.
- Khi chuyển sang hình ảnh: ưu tiên tư liệu thật; AI không được lộ vẻ generic/giả.
