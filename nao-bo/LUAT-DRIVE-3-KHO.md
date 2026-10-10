# LUẬT DRIVE 3 KHO — chốt 2026-08-14, dùng mãi

Hùng chốt: ghi thành luật để **đỡ sửa đi sửa lại**. Không liên quan Cline / LiteLLM.

## Vì sao từng mệt
- rclone dùng **client chung** rclone.org → chết 2026.
- OAuth Google để **Testing** → token ~7 ngày đứt, phải login lại.
- 3 Gmail nhét 1 ống `DriveVideoTikTok`.

## Luật (cấm phá)

1. **1 OAuth Desktop app** — đã có: `~/<project-b>/client_secret.json` (project `gen-lang-client-[redacted]`). Cấm tạo project/client mới trừ khi app này mất.
2. **3 cửa, 3 Gmail, không trộn:**
   - `drive-primary` → `[email-1]` (kho1)
   - `drive-secondary` → `[email-2]` (kho2, thay `DriveVideoTikTok`)
   - `drive-tertiary` → `[email-3]` (kho3)
3. **Cùng 1 `client_id`**, 3 token khác nhau. Không tạo 3 client.
4. **Cấm** remote rclone không có `client_id` riêng (client chung rclone).
5. **Cấm** xoá 3 token Python: `~/kho-khoa-hoc/token_3870.json`, `token_23870.json`, `token_[user-3].json` + `kho_config.json`.
6. OAuth consent phải **Production / Published**. Testing = đứt 7 ngày = đúng cái mệt.
7. Máy 24/7 / Hermes: **copy** `~/.config/rclone/rclone.conf` + 3 token Python. Không cấu hình lại từ đầu.
8. Script mới chỉ gọi `drive-primary:` / `drive-secondary:` / `drive-tertiary:` hoặc 3 token Python. Cấm bịa remote thứ 4.

## Việc còn lại (1 buổi, rồi hết)
1. Google Cloud → OAuth consent → Publish.
2. Gắn `client_id` vào 3 remote → login đúng 3 Gmail, mỗi cái 1 lần.
3. Test: `rclone lsd drive-primary:` · `drive-secondary:` · `drive-tertiary:`

Chưa làm bước này thì rclone vẫn sống trên client chung — **đừng gắn client rồi bỏ login** (gãy Drive đang dùng).
