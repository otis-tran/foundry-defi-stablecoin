# Solidity Input Validation Checklist

## 🧠 Mục tiêu

Khi viết smart contract, đặc biệt là các hàm `public` hoặc `external`, việc kiểm tra dữ liệu đầu vào (input sanitization) là **bước tối quan trọng** để:

- Tránh hành vi không mong muốn hoặc lỗi logic.
- Ngăn chặn các cuộc tấn công như reentrancy, overflow, hay dùng `address(0)`.
- Tăng độ tin cậy và bảo mật của toàn bộ hệ thống.

---

## ✅ Checklist kiểm tra dữ liệu đầu vào

| Hạng mục kiểm tra | Giải thích | Gợi ý triển khai |
|------------------|------------|------------------|
| **Không nhận `address(0)`** | Tránh việc gửi token hoặc giao quyền cho địa chỉ rỗng. | `require(addr != address(0), "Invalid address");` |
| **Số lượng > 0** | Tránh truyền giá trị 0 vào logic xử lý số lượng, ví dụ `deposit`, `transfer`, `mint`,... | `require(amount > 0, "Amount must be greater than 0");` |
| **Kiểm tra token hợp lệ** | Đảm bảo chỉ các token được hỗ trợ mới được xử lý. | Dùng `mapping(address => bool)` + modifier |
| **Không cho phép số âm (nếu dùng int)** | Solidity `uint` không âm, nhưng nếu dùng `int`, cần kiểm tra rõ ràng. | `require(value >= 0, "Negative value not allowed");` |
| **Không cho phép thao tác lặp lại/race condition** | Tránh reentrancy hoặc trạng thái không mong muốn. | Dùng `nonReentrant` của OpenZeppelin |

---

## 🔁 Tối ưu bằng `modifier`

Với các điều kiện được sử dụng nhiều lần trong các hàm khác nhau, nên sử dụng `modifier` để:

- Tái sử dụng logic kiểm tra.
- Tăng tính đọc hiểu của code.
- Giảm trùng lặp và lỗi khi bảo trì.

### 📌 Ví dụ:

```solidity
modifier moreThanZero(uint256 amount) {
    require(amount > 0, "Amount must be greater than 0");
    _;
}

modifier notZeroAddress(address addr) {
    require(addr != address(0), "Zero address not allowed");
    _;
}

modifier isAllowedToken(address token) {
    require(allowedTokens[token], "Token not supported");
    _;
}
