# WORKFLOW DỰNG VIDEO SÁCH — bản vận hành duy nhất

> **Trạng thái:** ĐANG ÁP DỤNG  
> **Phiên bản:** 1.0  
> **Cập nhật:** 2026-08-12  
> **Phạm vi:** Tất cả video sách Remotion của Trạm Ghé Tâm Hồn.

## 0. Kết quả workflow phải tạo ra

Một video sách không chỉ tóm tắt sách. Mỗi video lấy **một ý sách**, nối với đời sống và bằng chứng thật để người xem **xem ít nhưng hiểu nhiều**.

**Công thức nội dung mặc định:**  
`Hook → Ý sách → Ví dụ đời thật → Bằng chứng/số liệu → Mở rộng góc nhìn → Câu hỏi tương tác → Nhá phần tiếp theo`

**Luật điều phối quan trọng nhất:**  
`Mỗi lần chỉ dựng 1 scene → mở preview thật → Hùng duyệt → LOCKED → mới sang scene kế.`

Không được bỏ qua trạng thái, dựng hàng loạt hoặc render full sớm.

## 1. Bộ hồ sơ duy nhất của mỗi dự án

| File/thư mục | Vai trò | Quy tắc |
|---|---|---|
| `KICH-BAN.md` | Kịch bản gốc | Chỉ một bản đang dùng |
| `PROJECT-STATE.md` | Trạng thái trung tâm | Agent phải đọc và cập nhật trước/sau mỗi bước |
| `SCENE-PLAN.md` | Lời thoại → scene → hình → chuyển động → SFX | Chỉ sửa theo quyết định mới nhất của Hùng |
| `SOURCES.md` | Sách, số liệu, ngày, phạm vi, link | Claim chưa chắc ghi `CHƯA DÙNG` |
| `ASSET-LOG.md` | Asset local, nguồn, tác giả, license, scene | Asset chưa rõ quyền không được dùng |
| `style-contract.md` | Font, màu, bố cục, ngoại lệ dự án | Ngoại lệ phải được Hùng duyệt |
| `voice-final.*` | Giọng cuối | Trục timing duy nhất |
| `src/` + `public/` | Code và asset Remotion | Không để bản v2/v3 mơ hồ làm nguồn chính |
| `out/` | File render | Chỉ bản đã kiểm mới ghi hoàn thành |

Nếu có nhiều bản, bản đang dùng phải ghi `CANONICAL`; bản cũ ghi `LƯU TRỮ/CHỈ THAM KHẢO`.

## 2. Máy trạng thái bắt buộc

```text
IDEA
  → SCRIPT_LOCKED
  → VERIFIED
  → ASSETS_READY
  → VO_READY
  → SCENE_PLAN_LOCKED
  → SCENE_01_BUILDING
  → SCENE_01_REVIEW
  → SCENE_01_LOCKED
  → ... lặp từng scene ...
  → ALL_SCENES_LOCKED
  → TIMELINE_ASSEMBLED
  → SUB_SYNCED
  → AUDIO_MIXED
  → PHONE_QA_PASSED
  → DRAFT_RENDERED
  → FINAL_APPROVED
```

Trạng thái phụ:

- `BLOCKED`: thiếu quyết định, nguồn, asset, voice hoặc lỗi kỹ thuật.
- `REOPENED`: scene đã khóa nhưng bị ảnh hưởng bởi thay đổi chung.
- `FAILED_QA`: bản ghép/render có lỗi và phải quay lại đúng bước gây lỗi.

Agent chỉ được làm **hành động kế tiếp** ghi trong `PROJECT-STATE.md`.

## 3. Workflow vận hành

### Bước 0 — Khởi tạo dự án

**Làm:**

1. Tạo bộ hồ sơ ở Mục 1.
2. Ghi mục tiêu, người xem, thời lượng mong muốn, khung 1080×1920 và thông điệp duy nhất.
3. Chỉ định rõ kịch bản và composition mới; không đụng bản cũ nếu chưa được phép.

**Gate:** Hùng chốt mục tiêu và kịch bản nào là nguồn chính.  
**Đầu ra:** trạng thái `IDEA` → `SCRIPT_LOCKED`.  
**Dừng nếu:** có hai kịch bản cạnh tranh hoặc chưa rõ video làm cho ai.

### Bước 1 — Khóa nội dung và kiểm chứng

**Làm:**

1. Kiểm tra video chỉ đào sâu **một ý sách**, không tóm cả cuốn.
2. Tách Hook, ý sách, ví dụ đời thật, bằng chứng, mở rộng, câu hỏi và teaser.
3. Mọi số liệu phải có nguồn, ngày và phạm vi trong `SOURCES.md`.
4. Phân biệt rõ:
   - `ĐƯỢC DÙNG`: đã đủ bằng chứng.
   - `CẦN HÙNG DUYỆT`: diễn đạt hoặc nguồn còn tranh luận.
   - `CHƯA DÙNG`: chưa đủ chắc.

**Gate:** Hùng duyệt lời thoại và claim được dùng.  
**Đầu ra:** `SCRIPT_LOCKED` → `VERIFIED`.  
**Dừng nếu:** có số liệu chưa rõ nguồn hoặc lời thoại vượt thời lượng tự nhiên mà chưa được Hùng chấp nhận.

### Bước 2 — Chia scene theo nghĩa

**Làm:**

1. Chia theo thay đổi ý, cảm xúc và chức năng hình ảnh; không cắt máy móc mỗi 3 giây.
2. Mỗi scene ghi đủ: lời thoại, điều hình phải biểu đạt, asset, chuyển động, chữ, SFX, điểm nối cảnh.
3. Một scene chỉ có **một điểm nhìn chính**.
4. Hình, lời và phụ đề phải làm ba việc khác nhau:
   - Lời giải thích.
   - Hình chứng minh/gợi cảm xúc.
   - Phụ đề giúp theo dõi và nhấn từ khóa.

**Gate:** Hùng duyệt `SCENE-PLAN.md`.  
**Đầu ra:** `VERIFIED` → `SCENE_PLAN_LOCKED`.  
**Dừng nếu:** hình chỉ lặp nguyên lời hoặc một scene chứa quá nhiều ý.

### Bước 3 — Tìm và kiểm asset

**Thứ tự ưu tiên:**

1. Video thật.
2. Ảnh thật.
3. Bản đồ, biểu đồ, số liệu hoặc đồ họa.
4. Hình vẽ khi không có tư liệu phù hợp hoặc ý quá trừu tượng.

**Làm:**

- Hình phải biểu thị đúng câu đang nói; không dùng để lấp chỗ trống.
- Hình vẽ phải nhìn là hiểu ngay, dùng tiếng Việt.
- Không tái dùng cảnh nếu không có chức năng kể chuyện mới.
- Lưu đường dẫn local, link gốc, tác giả/license, ngày kiểm và scene dùng vào `ASSET-LOG.md`.
- Test asset mở được trong Remotion và test một frame trước.

**Gate:** Hùng duyệt asset chính hoặc look test.  
**Đầu ra:** `VERIFIED` → `ASSETS_READY`.  
**Dừng nếu:** asset sai nghĩa, mờ, trống, không rõ quyền hoặc chỉ mang tính trang trí.

### Bước 4 — Nhận voice cuối và khóa timing

**Làm:**

1. Dùng đúng `voice-final.*`; không lấy voice nháp cũ.
2. Đo thời lượng và lấy timestamp thật.
3. Cập nhật độ dài scene theo giọng.
4. Nếu chưa có voice, chỉ được storyboard/look test; không khóa timing và phụ đề.

**Gate:** Hùng xác nhận file voice cuối.  
**Đầu ra:** `ASSETS_READY` → `VO_READY`.  
**Dừng nếu:** voice và kịch bản không khớp.

### Bước 5 — Vòng lặp dựng từng scene

Với scene `X`, agent phải làm đúng thứ tự:

1. Đọc `PROJECT-STATE.md`, `SCENE-PLAN.md`, `style-contract.md` và quyết định mới nhất.
2. Chuyển trạng thái thành `SCENE_X_BUILDING`.
3. Chỉ sửa/dựng **Scene X**.
4. Kiểm ngay:
   - đúng asset và đúng câu;
   - không lộ lớp cũ;
   - chữ không cắt, không xuống hàng vô lý;
   - animation có lý do kể chuyện;
   - preview không lỗi.
5. Mở composition/URL preview thật cho Hùng.
6. Báo theo mẫu:

```text
SCENE X — REVIEW
Lời thoại:
Asset đã dùng:
Chuyển động/chuyển cảnh:
Chữ/phụ đề:
SFX dự kiến:
Thiếu hoặc còn nghi ngờ:
Preview:
```

7. Chuyển trạng thái `SCENE_X_REVIEW` và **DỪNG**.
8. Chỉ khi Hùng nói `OK Scene X`:
   - ghi quyết định;
   - đổi thành `SCENE_X_LOCKED`;
   - mới mở scene kế tiếp.
9. Hùng chê thì chỉ sửa Scene X; không nhảy cảnh khác.

Khi mọi scene khóa: `ALL_SCENES_LOCKED`.

### Bước 6 — Ghép timeline và canh phụ đề

**Chỉ được làm khi:** `ALL_SCENES_LOCKED`.

**Làm:**

1. Ghép scene theo `SCENE-PLAN.md`.
2. Canh phụ đề theo timestamp voice cuối, không đoán theo số chữ.
3. Font mặc định **Montserrat local**.
4. Ngắt dòng theo cụm nghĩa; không để từ cô độc ở dòng mới.
5. Phụ đề hiện lần lượt theo lời; không hiện nguyên đoạn từ đầu.
6. Từ quan trọng nhấn vàng/đỏ, không tô quá nhiều.
7. Tên **TRẠM GHÉ TÂM HỒN** nổi hơn phụ đề nhưng không che Hook.
8. Khung chữ vừa nội dung, padding đều, không đè lớp cũ.
9. Né UI TikTok bên phải và vùng caption dưới.

**Gate:** xem full không tiếng và kiểm toàn bộ chữ trên khung điện thoại.  
**Đầu ra:** `ALL_SCENES_LOCKED` → `TIMELINE_ASSEMBLED` → `SUB_SYNCED`.

### Bước 7 — Thiết kế âm thanh theo hành động

**Nguyên tắc:** voice rõ nhất; nhạc và SFX hỗ trợ, không clipping. Không dùng volume `2` hoặc `3` như luật chung vì mỗi file nguồn khác nhau.

| Hành động | SFX ưu tiên |
|---|---|
| Máy ảnh xuất hiện | Chụp ảnh |
| Chuyển trang | Lật sách |
| Sang phần tiền | Sột tiền |
| Chuyển khoản | Xác nhận giao dịch |
| Đường bản đồ chạy | Tuyến đường, hàng hóa, thư lệnh, quân lính |
| Ảnh đóng khung | Đóng/ghim ảnh |
| Tôn giáo | Chuông, không khí trang nghiêm |
| Số phần trăm | Bộ đếm |
| Câu hỏi | Âm gợi thắc mắc |
| Khoa học | Mô-tơ, relay, máy móc rồi bật sáng |

- Giảm tiếng “ting” chung chung.
- Mỗi thời điểm ưu tiên một SFX chính.
- Nghe bằng loa điện thoại và tai nghe.
- Kiểm đoạn im, nhạc lấn lời và clipping.

**Gate:** Hùng duyệt bản nghe full.  
**Đầu ra:** `SUB_SYNCED` → `AUDIO_MIXED`.

### Bước 8 — QA điện thoại và render

**Trước render:**

- Kiểm dung lượng ổ đĩa, codec, asset, font và composition ID.
- Xem đầu–giữa–cuối và mọi điểm chuyển cảnh/SFX quan trọng.
- Kiểm 1080×1920, safe zone, chữ nhỏ, chữ cắt, frame đen, layer cũ và tiếng Anh ngoài ý muốn.

**Render:**

1. Chỉ render nháp khi `PHONE_QA_PASSED`.
2. Mở file MP4 thật sau render; thông báo render thành công chưa phải bằng chứng.
3. Ghi đường dẫn file, duration, codec, kích thước và trạng thái duyệt.
4. Chỉ khi Hùng xem file thật và nói OK mới đổi `FINAL_APPROVED`.

## 4. Style mặc định đã chốt

- Font: **Montserrat** cài local.
- Hình: tư liệu thật kết hợp minh họa.
- Minh họa: giấy cũ, mực vẽ, vàng kem–nâu–đỏ; cảm giác sách và học thức.
- Chữ đủ lớn trên điện thoại; không có chỗ to/nhỏ vô lý.
- Không để khung trống, hình đơn sơ hoặc trang trí không liên quan.
- Chuyển động phải biểu thị hành động hoặc ý nghĩa, không chạy chỉ để “cho vui”.
- Nguồn dài để trong caption/credit; trên video chỉ giữ nguồn ngắn, đọc được.

Ngoại lệ chỉ hợp lệ khi Hùng duyệt và ghi trong `style-contract.md`.

## 5. Khi Hùng sửa luật chung giữa chừng

1. Không sửa âm thầm tất cả scene.
2. Ghi thay đổi vào workflow hoặc `style-contract.md`.
3. Liệt kê scene bị ảnh hưởng.
4. Đổi chúng từ `LOCKED` thành `REOPENED`.
5. Sửa và duyệt lại từng scene.
6. Tăng phiên bản + ghi Changelog nếu thay đổi áp dụng cho mọi video sau.

## 6. Mẫu `PROJECT-STATE.md`

```md
# PROJECT STATE

- Project:
- Canonical script:
- Final voice:
- Remotion root:
- Composition đang xem:
- Tổng scene:
- Trạng thái hiện tại:
- Scene đang làm:
- Scene đã LOCKED:
- Scene REOPENED:
- Blocker:
- Hành động duy nhất được phép tiếp theo:
- Quyết định mới nhất của Hùng:
- Preview URL:
- File render gần nhất:
- Cập nhật lúc:
```

## 7. Luật cứng

- Không dựng hàng loạt trước khi Hùng duyệt.
- Không đoán; không biết thì kiểm tra hoặc hỏi.
- Không dùng hình chỉ để lấp chỗ trống.
- Không render full khi từng scene chưa khóa.
- Không tự thay kịch bản, số liệu, asset hoặc scene đã khóa.
- Không gọi hoàn thành chỉ vì code/build/render báo thành công.
- Không được tự chuyển trạng thái khi Gate chưa có bằng chứng.

## Changelog

- **v1.0 — 2026-08-12:** Chuyển toàn bộ bài học Sapiens P3 thành workflow có đầu vào, máy trạng thái, Gate, vòng duyệt từng scene, QA âm thanh/điện thoại và điều kiện hoàn thành.
