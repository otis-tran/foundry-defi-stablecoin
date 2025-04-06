# 📚 Decentralized Finance (DeFi)
> Tài liệu tham khảo: [Decentralized Finance (DeFi) - Cyfrin](https://www.cyfrin.io/glossary/decentralized-finance-defi)

---

## 💡 Giới thiệu

**DeFi (Tài chính phi tập trung)** là các dịch vụ và sản phẩm tài chính được xây dựng trên nền tảng blockchain, chủ yếu sử dụng **smart contracts**.

Các dịch vụ này **không cần trung gian tài chính** như ngân hàng hay môi giới, cho phép người dùng **giao dịch trực tiếp (peer-to-peer)**.  
DeFi **tự động hóa hoạt động tài chính bằng code**, giúp người dùng **giao dịch, cho vay, đi vay, đầu tư** mà không cần đến tổ chức quản lý tập trung.

---

## 🧬 Đặc điểm nổi bật của DeFi

### ✅ Truy cập không cần cấp phép (*Permissionless Access*)

- Không tổ chức nào kiểm soát quyền truy cập.
- Bất kỳ ai có ví crypto đều có thể tham gia – **không giới hạn vị trí, tài sản, hay giấy phép**.
- Truy cập 24/7 toàn cầu, người dùng **tự giữ tài sản (self-custody)**.
- Bất kỳ ai cũng có thể xây dựng và triển khai giao thức DeFi → **khuyến khích đổi mới và phát triển hệ sinh thái**.

---

### 🔍 Minh bạch (*Transparency*)

- Tất cả giao dịch **hiển thị công khai trên chuỗi (on-chain)**.
- Mã smart contract **có thể kiểm tra công khai**.
- Quy tắc giao thức được mã hóa → **ai cũng có thể xem xét và xác minh**.

---

### 🧩 Khả năng kết hợp (*Composability*)

- Các giao thức DeFi có thể **tương tác và xây dựng trên nhau**.
- Cho phép:
    - **Người dùng** kết hợp nhiều giao thức trong một giao dịch.
    - **Developer** tạo ứng dụng mới bằng cách **tái sử dụng các giao thức có sẵn như Lego**.

---

---

## ⚙️ Core Components (Các thành phần cốt lõi)

### 📜 Smart Contracts

Smart contracts là các chương trình tự thực thi được lưu trữ trên blockchain, giúp tự động hóa và thực thi các thỏa thuận mà không cần bên trung gian.

🔧 **Chức năng chính của smart contracts trong DeFi**:

- Trao đổi và hoán đổi tài sản (Asset exchanges & swaps)
- Cơ chế cho vay và đi vay (Lending & Borrowing)
- Tính toán và phân phối lãi suất (Interest rate calculations & distributions)
- Quản lý tài sản thế chấp và thanh lý (Collateral management & liquidations)
- Tạo và đốt token (Token minting & burning)
- Thực hiện quy trình quản trị (Governance processes)

---

### 💠 Tokens (Các loại token trong DeFi)

DeFi sử dụng nhiều loại token để đại diện cho tài sản và phân quyền điều hành:

#### 1. Fungible Tokens (ERC-20) – Token có thể thay thế
- Dễ trao đổi
- Ví dụ: USDC, DAI, ETH, các token hóa tài sản (tokenized assets)

#### 2. Non-Fungible Tokens (ERC-721) – Token không thể thay thế
- Đại diện cho tài sản số duy nhất
- Ví dụ: NFTs

#### 3. Liquidity Pool Tokens – Token đại diện thanh khoản
- Đại diện cho phần đóng góp của người dùng vào pool thanh khoản (trading pool)
- Người dùng kiếm phí giao dịch thông qua sở hữu token này
- Ví dụ: Uniswap LP tokens, Curve LP tokens

#### 4. Governance Tokens – Token quản trị
- Cho phép chủ sở hữu **biểu quyết các thay đổi trong giao thức**
- Ví dụ:
    - **AAVE** – dùng trong quản trị của Aave
    - **UNI** – dùng trong quản trị của Uniswap

#### 5. Wrapped Tokens – Token được "bọc"
- Đại diện cho tài sản từ chain khác được đưa sang
- Ví dụ: **wBTC** – đại diện cho Bitcoin trên mạng Ethereum

---

---

## 💼 Common DeFi Services

### 🔁 Decentralized Exchanges (DEXs)

DEX là các giao thức cho phép giao dịch tiền mã hóa **trực tiếp giữa người dùng** mà không cần bên trung gian. Các giao thức này sử dụng **smart contract** để:

- Tự động thực hiện giao dịch
- Quản lý pool thanh khoản
- Không yêu cầu bên thứ ba nắm giữ tài sản của người dùng

⚙️ Các tính năng chính của DEX:

- Sử dụng cơ chế **Automated Market Maker (AMM)** để định giá tài sản
- Người dùng có thể cung cấp thanh khoản và nhận phí giao dịch
- Hỗ trợ các tính năng nâng cao như **limit orders**
- Dễ dàng tích hợp với các giao thức DeFi khác

---

### 📥 Staking và Liquid Staking

Staking là hành động **khóa token** trong các mạng **Proof-of-Stake (PoS)** để:

- Bảo vệ mạng lưới
- Góp phần vào quá trình xác thực giao dịch
- Nhận phần thưởng staking

#### Traditional Staking (Staking truyền thống)

- Tự vận hành node validator, hoặc **ủy quyền (delegate)** token cho validator khác
- Token bị khóa, **không thể sử dụng cho đến khi unstake**
- Sau khi unstake, có thể phải chờ **thời gian unbonding** (phụ thuộc mạng)

#### 💧 Liquid Staking (Staking thanh khoản)

- Stake token thông qua **giao thức liquid staking** (ví dụ: Lido)
- Nhận token đại diện (ví dụ: **stETH**) → có thể sử dụng trong các giao thức DeFi khác
- Token gốc vẫn được stake → **vẫn nhận phần thưởng staking**
- Có thể sử dụng **stETH** để giao dịch, cung cấp thanh khoản, hoặc thế chấp

📌 *Sự khác biệt chính*:

| Traditional Staking | Liquid Staking |
|---------------------|----------------|
| Token bị khóa hoàn toàn | Token vẫn được đại diện bởi token thanh khoản |
| Không thể sử dụng token khi đang stake | Có thể sử dụng token đại diện trong DeFi |
| Phải đợi unbonding để sử dụng lại | Có thanh khoản ngay lập tức qua token đại diện |

---

### ⚙️ Automated Market Makers (AMMs)

AMM là các smart contract tự động thực hiện giao dịch và quản lý pool thanh khoản trong DEXs.

👥 Người dùng có thể:

- Cung cấp thanh khoản cho pool và **nhận phí giao dịch**
- Nhận thêm token khuyến khích từ giao thức
- Kết hợp với staking token để **tăng lợi nhuận** (ví dụ: dùng stETH trong pool AMM)

---

### 💸 Lending & Borrowing (Cho vay và đi vay)

Các giao thức lending DeFi cho phép **cho vay – vay mượn tài sản ngang hàng (peer-to-peer)** thông qua smart contracts.

📊 Người dùng có thể:

- Cho vay tài sản để **nhận lãi suất**
- Vay tài sản bằng cách **cung cấp tài sản thế chấp**
- Tự điều chỉnh vị thế theo điều kiện thị trường
- Sử dụng **flash loans** – khoản vay không cần thế chấp trong một giao dịch duy nhất
- Tiếp cận **đòn bẩy tài chính** thông qua các thị trường lending

💡 Ví dụ: Trên Aave, người dùng có thể:
- Cho vay ETH để nhận lãi
- Vay USDC bằng cách thế chấp ETH

---
## Cài đặt

Cài đặt OpenZeppelin dependencies dùng Foundry:
```bash
forge install OpenZeppelin/openzeppelin-contracts --no-commit
```

Generate remapping:
```bash
forge remappings > remappings.txt
```

---
## ⚠️ Errors

### Overriding function visibility differs
Lỗi này xảy ra khi **visibility** của hàm trong contract con không khớp với **visibility** của hàm trong contract cha khi đang ghi đè.

🛠️ Solution: 
> Đảm bảo rằng hàm ghi đè có cùng **visibility** như hàm trong contract cha.
