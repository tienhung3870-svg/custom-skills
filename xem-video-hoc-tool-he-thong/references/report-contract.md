# Mẫu báo cáo: học tool và hệ thống

1. **Kết luận ngắn:** mục tiêu Hùng giao; điều đáng học; nên dùng, sửa hay để sau và vì sao.
2. **Nguồn và độ phủ:** mã nguồn, đường dẫn/link, loại, phiên bản/ngày, mốc/trang/đoạn đã kiểm, phần chưa kiểm. Video ghi riêng hình, tiếng và transcript.
3. **Luồng đúng nguồn:** `mốc/trang → trạng thái trước → thao tác/nội dung → trạng thái sau/đầu ra → vai trò`. Phần bổ sung do agent đề xuất đặt riêng với lý do.
4. **Tool/kiến thức:** tên, công dụng, đầu vào/đầu ra, dependencies, thủ công/tự động, repo/tài liệu chính thức nếu thực sự xác minh được.
5. **Bảng kiểm claim:** `claim | nguồn đã nói | bằng chứng độc lập/ngày | trạng thái | hệ quả`. Trạng thái: `ĐÃ THẤY`, `ĐÃ NGHE`, `SUY LUẬN`, `ĐÃ KIỂM NGUỒN CHÍNH`, `ĐÃ CHẠY LOCAL`, `CHƯA XÁC MINH`; một ô không được nâng cấp trạng thái bằng suy đoán. Với giá/trial/quảng cáo, ghi điều kiện và ngày xem hoặc chưa rõ.
6. **Đối chiếu hệ thống:** `vị trí/ổ đã kiểm | thấy gì | mức: file/cài/cấu hình/chạy/E2E | chưa kiểm được gì`. Chỉ kiểm phạm vi liên quan. Không kết luận “không có” từ một ổ chưa gắn.
7. **Quyết định và kế hoạch:** `giữ/dùng cái có | bổ sung | thay thế | để sau` kèm chứng cứ. Nếu đề xuất làm: `bước → kết quả cần thấy → cách kiểm → cách quay lại khi lỗi`.
8. **Thực nghiệm bước 9 (khi được yêu cầu):** dự án mẫu trong video hay bài thử tự thiết kế; phiên bản/nguồn; đầu vào và tiêu chí PASS; đầu ra quan sát được; bảng claim chính và phép tính tỷ lệ được hỗ trợ; chi phí một lần/định kỳ, trial và bằng chứng quota phục hồi; danh sách đã gỡ và dung lượng trước–sau. Ghi `CHƯA XÁC MINH` thay vì suy đoán.

Với nhiều nguồn, thêm bảng `mã nguồn | ý chính/tool | bằng chứng | mức kiểm | chi phí | hệ thống hiện có | đề xuất`. Dẫn về từng nguồn thay vì lặp toàn bộ nội dung. Giữ nguyên các bất đồng giữa nguồn cho tới khi giải quyết được.

Chỉ dùng chữ “đã chạy”, “đã cài”, “miễn phí”, “phù hợp máy Hùng” ở mức bằng chứng đã kiểm. Khi thiếu audio, repo hay đường dẫn thật, ghi rõ giới hạn và phép kiểm tiếp theo.
