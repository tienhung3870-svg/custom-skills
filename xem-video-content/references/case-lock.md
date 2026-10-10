# Case Lock v1

Khóa đúng nguồn trước khi tiếp tục một video/case đã tồn tại. Không lưu file này vào case; đây là hợp đồng kiểm tra.

| Lớp | Nguồn chuẩn cần xác định | Evidence tối thiểu | Trạng thái |
|---|---|---|---|
| Case | thư mục case/project đang dùng | đường dẫn + mục tiêu hiện tại | `ACTIVE/DRAFT/STALE` |
| Script | một file lời duy nhất | đường dẫn + câu đầu/cuối + Hùng chốt | `LOCKED/MISMATCH/UNKNOWN` |
| Voice | file audio dùng để dựng | đường dẫn + duration thật + khớp script | `LOCKED/MISMATCH/MISSING` |
| Style | style contract/brand version | đường dẫn + quyết định còn hiệu lực | `LOCKED/CONFLICT/UNKNOWN` |
| Asset | ảnh/video/font/nhạc thật | đường dẫn + đã duyệt hay chưa | `APPROVED/TEMP/MISSING` |
| Composition | component Remotion thật | composition ID + file import trong registry | `ACTIVE/STALE/BROKEN` |
| Output | file render mục tiêu | đường dẫn + probe + xem thật | `APPROVED/REVIEW/STALE/MISSING` |

## Quy tắc PASS

Chỉ chuyển sang chia scene/dựng/render khi Script và Voice là `LOCKED`, Composition là `ACTIVE`, Style không `CONFLICT`. Asset có thể `MISSING` ở giai đoạn storyboard nhưng không được `TEMP/MISSING` khi báo bản cuối.

Nếu một lớp `MISMATCH`, `CONFLICT` hoặc `UNKNOWN`, dừng tại lớp đó, đưa evidence và xin đúng một quyết định của Hùng.
