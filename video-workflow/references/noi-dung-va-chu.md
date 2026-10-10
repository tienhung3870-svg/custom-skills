# Bài học NỘI DUNG + CHỮ (bóc từ 2 video Hùng đưa, Gemini xem thật)
> Áp vào MỌI video của workflow. Nguồn: 2 clip Downloads (cách làm nội dung + typography).

## A. NỘI DUNG — thêm bước PROOF
- Hook 3-5s **KHÔNG phải yếu tố duy nhất** giữ chân (video chuyên môn/uy tín: retention đầu clip của video triệu view ≈ video ít view).
- **Cấu trúc tối ưu: HOOK → PROOF (bằng chứng) → THÂN → KẾT** (thêm PROOF ngay sau hook).
- **Proof** = tạo thẩm quyền, giữ chân: kinh nghiệm/số liệu thật · kết quả cá nhân · case study học viên/khách (ảnh/video thật).

## B. CHỮ / TYPOGRAPHY — chuẩn phụ đề social hiện đại
- **Word-by-word highlight:** chữ đang đọc **đổi màu/sáng đồng bộ với giọng** (từng chữ theo nhịp nói) — đây là điểm mấu chốt.
- **Font:** đậm, nét mạnh, sans-serif kiểu **Impact** — dễ đọc trên mobile màn nhỏ. Keyword viết **HOA (UPPERCASE)**.
- **Màu:** chữ trắng/vàng trên **nền tối**; keyword quan trọng tô **vàng/xanh lá** (HOOK, PROOF...). Tương phản cao.
- **Chuyển động:** pop-up / scale-in nhẹ theo nhịp nhấn giọng; highlight động (đổi màu/gạch chân) đồng bộ voiceover.
- **Bố cục:** căn giữa hoặc **nửa dưới** màn 9:16, **tránh vùng UI TikTok** (tim/share/avatar bên phải). Tracking + line-spacing gọn. Có thể thêm viền/shadow/bo góc nền cụm từ.
- Sơ đồ khi cần: mindmap/mũi tên (Hook→Proof→Thân→Kết) cho video giảng.

## → Đưa vào Remotion
- Component **`<WordHighlight>`**: nhận mảng từ + timestamp (từ voiceover) → highlight từng chữ đúng nhịp. TÁI DÙNG cho mọi video.
- Component **`<Keyword>`**: chữ HOA đậm + màu nhấn + pop-in.
- Nền tối + chữ trắng/vàng là mặc định.
