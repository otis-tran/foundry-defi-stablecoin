
---

## 🧾 Tổng Quan Giao Thức Stablecoin Phi Tập Trung

Giao thức này được xây dựng dựa trên hai hợp đồng thông minh cốt lõi:

- `DecentralizedStableCoin.sol`
- `DSCEngine.sol`

### 🔹 `DecentralizedStableCoin.sol`

Là một hợp đồng ERC20 đơn giản, được mở rộng với các tính năng:

- `ERC20Burnable` – hỗ trợ tính năng đốt token.
- `Ownable` từ OpenZeppelin – dùng để kiểm soát quyền truy cập.

Hợp đồng này hỗ trợ khởi tạo với các tham số cơ bản của ERC20 và cung cấp khả năng `mint`, `burn` token.

### 🔹 `DSCEngine.sol`

Đây là nơi chứa phần **logic chính** của giao thức. Hợp đồng này điều khiển toàn bộ hệ thống stablecoin phi tập trung, bao gồm các chức năng quan trọng như:

- `depositCollateralAndMintDsc()` – Gửi tài sản thế chấp và mint DSC.
- `redeemCollateral()` – Rút lại tài sản thế chấp.
- `burn()` – Đốt DSC token.
- `liquidate()` – Thanh lý các vị thế không đủ tài sản đảm bảo.

... và nhiều chức năng quan trọng khác đảm bảo sự an toàn và ổn định của giao thức.

---

### 🧪 Hệ Thống Kiểm Thử

Giao thức đi kèm với một bộ kiểm thử đầy đủ, bao gồm:

- ✅ Unit test  
- 🎲 Fuzz test  
- ♾️ Invariant test – đảm bảo các tính chất quan trọng luôn đúng trong mọi tình huống

> 💡 *Invariant test là yếu tố giúp phân biệt giữa lập trình viên trung bình và lập trình viên blockchain chuyên nghiệp.*

---

### ⚙️ Script Triển Khai

Dự án có sẵn các script triển khai (`deploy`) được cấu hình linh hoạt, tích hợp **Chainlink Price Feeds** để xác định giá trị tài sản thế chấp theo thời gian thực.

---
