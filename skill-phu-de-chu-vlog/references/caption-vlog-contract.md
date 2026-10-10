# Caption vlog contract

## Ý đã rút ra từ mẫu Alex Nguyen

Nguồn tham chiếu: TikTok `@alexnguye`, video `7650877944919018760`.

Trạng thái bằng chứng hiện tại: **HÙNG QUAN SÁT — CHƯA ĐỘC LẬP KIỂM CHỨNG TOÀN BỘ AUDIO/TIMESTAMP.** Các mốc 0–2s, 2–7s, 7–14s dưới đây là mô tả của Hùng; không được trích như phân tích đã đo từ video.

| Mốc Hùng quan sát | Dấu hiệu | Quy tắc áp dụng |
|---|---|---|
| 0–2s | Chữ rất nổi, nhiều vị trí; chuông mở đầu | Dùng hook đa tầng: chữ chính + nhãn ngữ cảnh + một nhấn. Kiểm tra hierarchy trước khi thêm chữ. |
| Chuyển ở ~2s | Cảnh vút qua | Swoosh chỉ dùng khi thay góc/cảnh nhanh, không dùng mặc định. |
| ~2–7s | Chữ nhiều vùng nhưng vẫn theo nghĩa | Mỗi vùng chữ phải có vai trò riêng; ngắt theo cụm nghĩa. |
| ~7–14s | Cắt/hiệu ứng/SFX dồn theo hành động, ví dụ đồng hồ có tick-tock | SFX gắn vật thể/hành động đang thấy; ưu tiên action-to-sound mapping. |

Kết luận áp dụng: **ADAPT**, không sao chép nguyên bản. Giữ nhịp và hierarchy; đổi font/màu/vùng an toàn theo brand và loại video.

## Hệ layout có thể mở rộng

Mỗi video có một `style-contract` riêng, nhưng tất cả scene phải dùng cùng token để sửa một chỗ áp dụng toàn bộ:

```ts
type CaptionStyle = {
  fontFamily: string;
  primarySize: number;
  secondarySize: number;
  emphasisColors: Record<string, string>;
  safeZones: { top: number; right: number; bottom: number; left: number };
  panel: { opacity: number; padding: number; radius: number };
};
```

Không hard-code font/cỡ/màu lặp trong từng scene. Mỗi scene chỉ khai báo caption beats và gọi token chung.

## Bảng quyết định mật độ

| Tình huống | Cách làm |
|---|---|
| Hook hoặc cú lật | Có thể 3 lớp chữ, entrance ngắn và SFX mở đầu. |
| Giải thích bình thường | 1 lớp chính + tối đa 1 lớp ngữ cảnh. |
| Số liệu/bằng chứng | Chữ số lớn, chú thích nhỏ nhưng đọc được; nguồn ở vùng an toàn. |
| Hình có mặt/chủ thể | Đặt chữ vào vùng trống, không đặt để “cho đầy”. |
| Cảnh nhanh | Rút cụm chữ, không tăng số dòng. |
| Cảnh chậm/cảm xúc | Giảm mật độ và cho hình thở. |

## Mẫu report phân tích clip tham chiếu

| Timestamp đã kiểm | Hình thực sự thấy | Audio/text thực sự nghe/đọc | Kỹ thuật | ADOPT/ADAPT/HOLD/REJECT | Bằng chứng |
|---|---|---|---|---|---|

Không điền timestamp hoặc audio nếu không xem/nghe được. Ghi `KHÔNG ĐỦ BẰNG CHỨNG` thay vì đoán.
