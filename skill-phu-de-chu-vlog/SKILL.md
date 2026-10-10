---
name: skill-phu-de-chu-vlog
description: Dựng phụ đề và typography dày nhịp nhanh cho vlog/short-form, nhưng vẫn rõ nghĩa, có hierarchy và bám chính xác voice-over cuối. Dùng khi Hùng nói “phụ đề vlog”, “chữ nhiều màu”, “chữ dày”, “kiểu Alex Nguyen”, “caption theo hành động”, hoặc cần phân tích/dựng chữ vlog trong Remotion.
---

# Phụ đề chữ vlog

## Mục tiêu và phạm vi

Skill này là **skill con của `ky-nang-edit`**. Nó chỉ bổ sung hệ chữ, nhịp hình và SFX cho vlog/short-form có mật độ cao; vẫn phải tuân thủ toàn bộ gate của `ky-nang-edit`: nguồn thật, voice-over cuối, dựng từng scene, mở preview và chờ Hùng duyệt.

Không bê nguyên phong cách vlog vào video sách. Chỉ mượn kỹ thuật giữ nhịp: chữ có phân cấp, xuất hiện đúng hành động và dày nhưng không loạn.

Đọc thêm [caption-vlog-contract.md](references/caption-vlog-contract.md) trước khi lập kế hoạch hoặc dựng.

## Luật bằng chứng

1. Nếu học từ clip tham chiếu, phải xem được khung hình **và** nghe/đọc được audio hoặc transcript. Không đủ thì ghi `KHÔNG ĐỦ BẰNG CHỨNG`.
2. Ghi nhận do Hùng mô tả phải ghi `HÙNG QUAN SÁT`, không biến thành kết luận độc lập.
3. Không suy diễn toàn bộ video từ thumbnail, caption hay vài frame.
4. Tách rõ: điều quan sát được → kỹ thuật rút ra → phần sẽ áp dụng/không áp dụng.

## Workflow

### 1. Khóa đầu vào

Trước khi dựng, kiểm tra và báo ngắn:

- Video thuộc vlog/short-form hay video sách.
- Kịch bản gốc và scene hiện tại.
- File voice-over **cuối** và thời lượng thật.
- Asset có license/nguồn rõ ràng.
- Mẫu tham chiếu nào đã kiểm chứng, mẫu nào mới là quan sát của Hùng.

Chưa có voice cuối: chỉ làm caption-beat sheet/placeholder; **không gọi là đã canh phụ đề**.

### 2. Tạo caption-beat sheet cho đúng một scene

Lập bảng rồi mới code:

| Mốc theo voice | Cụm lời thoại | Lớp chữ | Vị trí | Màu/nhấn | Chuyển động | Hình/SFX bám hành động | Mục đích |
|---|---|---|---|---|---|---|---|

Mốc dựa trên file giọng hoặc transcript có timestamp, không chia máy móc theo số giây. Một beat chỉ được thêm chữ/SFX nếu nó làm một trong năm việc: **định hướng, thời gian/bối cảnh, nhấn ý, phản ứng, bằng chứng**.

### 3. Ba lớp chữ

1. **Lớp chính:** cụm lời đang đọc; 1–2 dòng; lớn nhất; hiện theo cụm nghĩa/từ đang nói.
2. **Lớp ngữ cảnh:** POV, thời gian, địa điểm hoặc nhãn cảnh; ngắn; chỉ một thông tin bổ trợ mỗi beat.
3. **Lớp nhấn:** 1 từ/cụm hoặc sticker có chức năng rõ; màu để mã hóa nghĩa, không phải trang trí.

Quy tắc bắt buộc:

- Ngắt dòng theo cụm nghĩa, không xuống hàng vô cớ.
- Nhiều vị trí được phép, nhưng bình thường chỉ tối đa 3 vùng chữ đọc được cùng lúc. Vượt mức này phải preview trên khung 1080×1920 và Hùng duyệt.
- Lớp chính luôn thắng về độ đọc; lớp phụ không được che mặt/chủ thể hoặc UI TikTok.
- Màu nhấn nhất quán trong từng video; không dùng nhiều màu nếu không mang nghĩa.
- Font, cỡ tối thiểu, vùng an toàn và màu lấy từ `style-contract` của dự án. Nếu chưa có, đề xuất rồi chờ Hùng chốt; không tự đoán.

### 4. Nhịp hình, animation và SFX

- Chữ vào/ra theo lời đọc, điểm chuyển ý hoặc hành động nhìn thấy trên hình.
- Transition phải có lý do nội dung: cut/click cho đổi góc, swoosh cho lướt/chuyển nhanh, lật trang cho sang ý sách, tick-tock khi có đồng hồ/thời gian.
- SFX phải bám hành động: máy ảnh → chụp; chuyển trang → lật sách; tiền → sột tiền; giao dịch → xác nhận; bản đồ/đường → tuyến đường/hàng hóa/lệnh/quân; ảnh vào khung → gắn khung; tôn giáo → chuông/không khí trang nghiêm; số liệu → bộ đếm; câu hỏi → âm gợi thắc mắc; khoa học → mô-tơ/relay rồi bật sáng.
- Không rải “ting” chung chung. Không chồng SFX đến mức lấn voice-over.
- Mỗi transition/SFX là một đối tượng/timing riêng để sau này thay thế hoặc chỉnh âm lượng không đụng toàn video.

### 5. Dựng và duyệt

1. Chỉ dựng đúng scene được phép trong Remotion.
2. Mở preview, nghe cả voice + music + SFX.
3. Báo: scene, đoạn voice, các lớp chữ, SFX/transition, asset và điểm chưa đủ bằng chứng.
4. Dừng chờ Hùng duyệt. Hùng chê thì chỉ sửa scene đó.
5. Không ghép/render full trước khi toàn bộ scene được khóa.

## QA bắt buộc trước khi khóa scene

- Đọc được ở màn hình điện thoại, không bị UI che.
- Chữ chính xuất hiện đúng lời đọc; không hiện nguyên đoạn quá sớm.
- Không có dòng ngắt sai nghĩa, cỡ chữ lạc tông, khung quá rộng/đè lớp cũ.
- Chữ phụ có lý do tồn tại; không có khoảng trống hoặc trang trí vô nghĩa.
- Mỗi asset diễn đạt đúng câu đang nói, không tái dùng cảnh vô lý.
- SFX nghe được nhưng không át giọng; không có `ting` thay cho SFX theo hành động.
- Preview không lỗi; nếu lỗi asset/audio, báo lỗi thật và sửa từ nguồn, không biến video thành ảnh giả mà không nói.

## Đầu ra khi nhận yêu cầu

Trước khi code trả một `caption-beat sheet` cho scene hiện tại. Sau preview trả đúng 5 dòng:

1. Scene và đoạn voice.
2. Chữ chính/phụ/nhấn đang dùng.
3. Hình, transition và SFX bám hành động.
4. Điều đã kiểm chứng và điều chưa đủ bằng chứng.
5. Chờ `OK Scene X` hoặc yêu cầu sửa cụ thể.
