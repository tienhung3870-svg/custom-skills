# Rubric bóc clip edit tham chiếu

Chỉ dùng khi mở được video/frame. `ĐÃ NGHE` chỉ được kết luận khi agent đã nghe thật ở đoạn cụ thể. Transcript chỉ chứng minh nhận dạng văn bản, không chứng minh đã nghe âm thanh/nhạc/SFX. Thiếu audio hoặc chưa nghe vẫn được phân tích hình và giới hạn kết luận tương ứng; không thay audio bằng suy đoán từ hình.

## 1. Phạm vi đã soi

Ghi tổng thời lượng thật, các dải mốc đã soi và các dải chưa soi. Không nói “cả clip” nếu chỉ nhìn vài frame hoặc đầu clip.

## 2. Bảng bóc mốc

| Mốc đã soi | ĐÃ THẤY: hình/bố cục | Chữ: câu, vị trí, hierarchy, ngắt nghĩa | Chữ vào/ra và chuyển cảnh | ĐÃ NGHE: nhạc/SFX/lời | Nhịp/cắt cảnh | Tài nguyên cần | Tác dụng giữ mắt | Evidence |
|---|---|---|---|---|---|---|---|---|

- Một hàng chỉ chứa những gì nhìn/nghe được trong chính dải mốc đó.
- Tách `ĐÃ THẤY`, `ĐÃ NGHE`, `SUY LUẬN`; thiếu một kênh thì ghi `KHÔNG ĐỦ BẰNG CHỨNG` cho kênh đó.
- Mô tả chữ theo cụm nghĩa và tầng đọc: hook, thông tin chính, thông tin phụ, nhấn. Không chỉ ghi "chữ nhiều màu".
- Mô tả SFX theo hành động: xuất hiện, vút qua, lật trang, bấm nút, đồng hồ, ảnh đóng khung... Không gọi chung là "ting".
- **Nhịp/cắt cảnh**: ghi tần suất cắt, loại chuyển cảnh (hard cut/fade/wipe), chuyển động camera (zoom/pan/tilt/static).
- **Tài nguyên cần**: stock/thật/AI, font, nhạc/SFX cần tìm, asset cần dựng.
- **Tác dụng giữ mắt**: giải thích bằng nhãn `SUY LUẬN`; không gọi "tăng giữ chân" hoặc "viral" nếu không có dữ liệu đo.
- Nhận xét của Hùng chỉ là **yêu cầu cần kiểm**, không được nâng thành `ĐÃ THẤY` hoặc `ĐÃ NGHE` nếu agent chưa tự kiểm.

## 3. Rút pattern có thể tái dùng

| Pattern đã thấy | Điều kiện để không rối | Nhánh hợp | Verdict | Không được bê nguyên xi vì |
|---|---|---|---|---|

- `SÁCH / BRAND`: ưu tiên ý sách → ví dụ đời thật → bằng chứng; giấy cũ/mực/tư liệu thật, ít chữ hơn và có khoảng thở.
- `VLOG / SHORT-FORM`: chữ dày và đổi liên tục được phép, nhưng mỗi cụm phải có một vai trò đọc rõ; chữ nền không được tranh cấp với hook.
- `PROOF / DỊCH VỤ EDIT`: comment/brief → before → after → timeline/công đoạn → kết quả; dùng để chứng minh năng lực edit, không phải form video sách.

## 4. Cổng kết luận

Đầu ra là rule có evidence, không phải lời khen/chê chung chung. Rule mới chỉ được đưa vào workflow sau khi Hùng duyệt. Nếu có chỗ chưa mở được hoặc chưa nghe được, kết luận `HOLD — KHÔNG ĐỦ BẰNG CHỨNG` thay vì lấp bằng mô tả.
