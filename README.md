# Custom Claude Code Skills

A collection of 10 custom Claude Code skills authored by **Hung Pham** for solo creator workflows, covering video script drafting, research & studying source videos, knowledge vault management, and multi-agent task handoffs.

These skills operate on local machines alongside the open-source Everything-Claude-Code (ECC) pack, providing domain-specific workflows tailored to content creation, technical research, and multi-agent execution.

---

## Skills Inventory

| # | Skill | 1-Line Description (EN) | Mô tả 1 dòng (VI) |
|---|---|---|---|
| 1 | [`viet-kich-ban-video`](./viet-kich-ban-video) | Multi-model script drafting pipeline (research → 3 drafts → Claude review → scene breakdown). | Quy trình nghiên cứu dẫn chứng, tạo 3 bản nháp đa mô hình, duyệt qua Claude và chia cảnh video chi tiết. |
| 2 | [`video-workflow`](./video-workflow) | Video deconstruction workflow: reverse-engineering reference clips into Remotion/React components. | Quy trình bóc tách video mẫu, dựng lại bằng Remotion/React và chuẩn hoá thành hợp đồng phong cách. |
| 3 | [`skill-phu-de-chu-vlog`](./skill-phu-de-chu-vlog) | Fast-paced, dense typography and caption styling for short-form vlogs synced to voice-overs and SFX. | Dựng typography và phụ đề dày, nhịp nhanh cho vlog/short-form, bám sát voice-over và hiệu ứng âm thanh. |
| 4 | [`xem-video-hoc-tool-he-thong`](./xem-video-hoc-tool-he-thong) | Structured extraction of tools, repos, and workflows from technical videos with local system verification. | Học công cụ AI, repo và quy trình từ video/tài liệu; kiểm chứng tính khả thi và đối chiếu hệ thống thực tế. |
| 5 | [`xem-video-content`](./xem-video-content) | Content deconstruction of reference videos to analyze narrative structure, messaging, hooks, and pacing. | Phân tích clip mẫu để bóc tách kịch bản, thông điệp cốt lõi, góc quay, nhịp dựng và bài học nội dung. |
| 6 | [`lay-tai-lieu-khoa-hoc`](./lay-tai-lieu-khoa-hoc) | Automated educational content archiver: clean Markdown extraction and structured video archiving to Drive. | Tự động cào tài liệu học tập từ web, trích xuất Markdown sạch và lưu trữ video bài giảng lên Google Drive. |
| 7 | [`nao-bo`](./nao-bo) | Context memory and session journal manager for the local Obsidian knowledge vault across AI agents. | Quản lý bộ nhớ ngữ cảnh dài hạn cho kho tri thức Obsidian (Não bộ), đồng bộ nhật ký phiên giữa các AI agent. |
| 8 | [`khong-gian-claude`](./khong-gian-claude) | File staging and workspace manager bridging project files into the Claude Desktop filesystem environment. | Cầu nối điều phối tệp tin và dự án vào Không gian làm việc Claude Desktop (MCP Filesystem). |
| 9 | [`nhan-tin`](./nhan-tin) | Asynchronous two-agent collaboration protocol via file exchange (Planner thinking + Executor building). | Điều phối bất đồng bộ giữa 2 AI agent theo mô hình Planner / Executor thông qua tệp giao tiếp trung gian. |
| 10 | [`goi-dien`](./goi-dien) | Direct agent-to-agent task execution via Model Context Protocol (MCP) for verified, scoped subtasks. | Điều phối tác vụ trực tiếp giữa Planner và Executor qua giao thức MCP cho các bài toán kỹ thuật nhỏ có kiểm soát. |

---

## Workflow Categorization

- **Video Script Drafting & Typography:** `viet-kich-ban-video`, `video-workflow`, `skill-phu-de-chu-vlog`
- **Technical Research & Video Study:** `xem-video-hoc-tool-he-thong`, `xem-video-content`, `lay-tai-lieu-khoa-hoc`
- **Knowledge Vault Management:** `nao-bo`, `khong-gian-claude`
- **Agent Task Handoffs:** `nhan-tin`, `goi-dien`

---

## Author

Authored and maintained by **Hung Pham**  
Website: [phamtienhung.me](https://phamtienhung.me)  
GitHub: [@tienhung3870-svg](https://github.com/tienhung3870-svg)
