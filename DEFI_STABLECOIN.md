
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

---

### Stablecoins, thật sự là gì?

Stablecoin đã trở thành một trong những chủ đề được bàn tán nhiều nhất trong lĩnh vực tiền điện tử và blockchain. Tuy nhiên, có rất nhiều thông tin sai lệch về stablecoin thực sự là gì và cách chúng hoạt động. Bài học này sẽ cung cấp một cái nhìn toàn diện, làm rõ những hiểu lầm phổ biến và giúp bạn hiểu sâu hơn về tầm quan trọng thực sự của stablecoin trong thế giới Web3.

#### Chúng ta sẽ tìm hiểu 5 phần:

1. Stablecoin là gì?
2. Tại sao chúng ta lại quan tâm đến stablecoin?
3. Phân loại và tính chất
4. Các thiết kế nổi bật
5. Stablecoin thật sự làm được gì?

---

### Stablecoin là gì?

**_Stablecoin là tài sản mã hóa ít biến động._**

Đơn giản là vậy. Chính xác hơn:

> Stablecoin là tài sản mã hóa có sức mua tương đối ổn định theo thời gian.

Ví dụ dễ hiểu là Bitcoin (BTC): số lượng táo bạn có thể mua với 1 BTC cách đây 6 tháng khác rất nhiều so với hiện tại. Trong khi đó, stablecoin cố gắng giữ giá trị mua sắm ổn định hơn, giống như một phiên bản "đồng đô la kỹ thuật số".

---

### Tại sao chúng ta quan tâm?

**_Tiền rất quan trọng._**

Xã hội cần một đơn vị tiền tệ ổn định để thực hiện 3 chức năng chính của tiền:

1. **Lưu trữ giá trị** – Giữ được giá trị để sử dụng sau này.
2. **Đơn vị tính toán** – Định giá hàng hóa, dịch vụ.
3. **Phương tiện trao đổi** – Làm trung gian để giao dịch hàng ngày.

Trong Web3, chúng ta cũng cần một đồng tiền ổn định để đáp ứng 3 chức năng này. BTC và ETH có thể là nơi lưu trữ giá trị và công cụ thanh toán tốt, nhưng **biến động giá** khiến chúng **không phù hợp làm đơn vị tính toán**.

---

### Phân loại và tính chất

Nhiều nguồn chia stablecoin thành:

- Bảo chứng bởi tiền pháp định (Fiat-Collateralized)
- Bảo chứng bởi crypto (Crypto-Collateralized)
- Bảo chứng bằng hàng hóa (Commodity-Collateralized)
- Thuật toán (Algorithmic)

Nhưng bài học này đề xuất cách phân loại sâu hơn:

1. **Ổn định tương đối** – Pegged/Anchored hay Floating  
2. **Phương pháp ổn định** – Governed hay Algorithmic  
3. **Loại tài sản thế chấp** – Nội sinh (Endogenous) hay Ngoại sinh (Exogenous)

#### 1. Ổn định tương đối

- **Pegged/Anchored**: Gắn giá trị với một tài sản như USD (VD: USDC, DAI).
- **Floating**: Không neo theo tài sản nào, dùng thuật toán để ổn định sức mua (VD: RAI).

#### 2. Phương pháp ổn định

Một yếu tố quan trọng khác phân biệt các stablecoin chính là cơ chế giữ giá ổn định.
Stablecoin được neo theo một tài sản khác bằng cách nào?

Thông thường, quá trình này liên quan đến việc tạo (mint) và tiêu hủy (burn) token, và phụ thuộc vào ai hoặc điều gì kiểm soát việc đó.

Chúng ta có thể xem quá trình này nằm trên một phổ (spectrum) từ có người điều hành (governed) đến thuật toán tự động (algorithmic):

- **Governed**: Có con người/tổ chức/DAO kiểm soát việc phát hành và đốt token.  
  - Ví dụ: USDC, USDT  
- **Algorithmic**: Hệ thống tự vận hành, không cần can thiệp con người.  
  - Ví dụ: DAI, FRAX, RAI, UST (đã sập)

> 🔸 DAI là ví dụ trung gian giữa governed và algorithmic. DAO quyết định lãi suất, nhưng việc mint/burn là tự động.

#### 3. Loại tài sản thế chấp

- **Exogenous** (Ngoại sinh): Tài sản thế chấp đến từ bên ngoài giao thức (như USD, ETH).  
- **Endogenous** (Nội sinh): Tài sản thế chấp là một phần của chính giao thức đó (như UST được bảo chứng bởi LUNA).

Cách phân biệt nhanh:

- Nếu **stablecoin sụp đổ, tài sản thế chấp có sụp theo không?**
  - Có → Nội sinh
  - Không → Ngoại sinh

> 🔸 UST/LUNA là ví dụ kinh điển về thất bại của stablecoin nội sinh, làm “bốc hơi” 40 tỷ đô khỏi DeFi.

---

### Vì sao vẫn có người muốn làm stablecoin nội sinh?

**Câu trả lời: Khả năng mở rộng và hiệu quả sử dụng vốn**

Với tài sản ngoại sinh, muốn phát hành thêm stablecoin thì cần thu hút tài sản thế chấp từ bên ngoài → giới hạn về quy mô. Trong khi đó, nội sinh có thể dễ dàng mở rộng, không bị giới hạn bởi tài sản bên ngoài.

> 🔍 Nếu bạn muốn tìm hiểu thêm về ý tưởng gốc của stablecoin nội sinh, hãy đọc [bài nghiên cứu của Robert Sams](https://blog.bitmex.com/wp-content/uploads/2018/06/A-Note-on-Cryptocurrency-Stabilisation-Seigniorage-Shares.pdf) – tiền đề cho nhiều thiết kế sau này.

---

### Thí nghiệm tư duy: Stablecoin gắn với vàng

Giả sử có stablecoin được bảo chứng bằng vàng, bạn có thể đổi ra vàng bất kỳ lúc nào tại ngân hàng.

Nhưng nếu ngân hàng **đóng cửa một tháng** thì sao? Lúc đó, **đồng stablecoin có còn "gắn với vàng" không, hay giá trị của nó sẽ tự định hình trên thị trường?**

Đây là ý tưởng của “**reflexivity**” – khi giá trị của tài sản không còn phụ thuộc hoàn toàn vào tài sản bảo chứng nữa.

---

### Một số stablecoin nổi bật

#### DAI

- Pegged
- Algorithmic
- Exogenous Collateralized

DAI dùng cơ chế thế chấp vượt mức (ví dụ nạp ETH để nhận DAI).
Bạn chỉ có thể tạo ít DAI hơn giá trị tài sản đã nạp.

Có một khoản phí ổn định hàng năm ~2% gọi là Stability Fee.

Nếu tài sản giảm giá hoặc không trả phí → bị thanh lý để đảm bảo hệ thống không bị thiếu tài sản thế chấp.

❓ Lúc này, bạn có thể hỏi: “Tại sao tôi phải trả phí để tạo stablecoin này?”
Chúng ta sẽ nói sau...

#### USDC
- Pegged
- Governed
- Exogenous

USDC được chống lưng bằng đô la thật

#### UST / LUNA
- Pegged
- Algorithmic
- Endogenous

UST được hỗ trợ bởi LUNA. Khi UST mất peg, LUNA cũng mất giá trị → Gây hiệu ứng đổ vỡ dây chuyền khiến toàn bộ hệ thống sụp đổ.

#### FRAX
- Pegged
- Algorithmic
- Hybrid

FRAX cố gắng cân bằng giữa tài sản nội sinh và ngoại sinh để đạt hiệu quả mở rộng và ổn định.

#### RAI
- Floating
- Algorithmic
- Exogenous

Không neo vào tài sản nào (floating)

Dùng ETH làm tài sản thế chấp

Giữ ổn định bằng cơ chế tự động, tối thiểu sự can thiệp con người

### Stablecoin dùng để làm gì?
❓ Stablecoin nào tốt nhất?
Câu trả lời phụ thuộc vào người sử dụng là ai.

USDC, Tether… tuy tập trung, nhưng thân thiện với người dùng.

DAI, RAI, FRAX… phi tập trung hơn, nhưng phức tạp hơn để sử dụng.

Sự thật thú vị: Stablecoin mà người dùng bình thường thích không quan trọng bằng stablecoin mà các cá voi (giàu có) ưa chuộng.

### Thí nghiệm tư duy 2
Bạn muốn mua thêm ETH, nhưng đã dồn hết tài sản vào ETH.

👉 Bạn nạp ETH vào giao thức stablecoin → mint stablecoin → bán stablecoin để mua thêm ETH.

Đây là giao dịch đòn bẩy (leveraged trading).

### Tóm gọn
❓ Vì sao dùng stablecoin?

Thực hiện 3 chức năng của tiền: đơn vị đo lường, lưu trữ giá trị, phương tiện trao đổi

❓ Vì sao mint stablecoin?

Để đặt cược đầu tư dùng đòn bẩy

>Đây mới chỉ là bề nổi của DeFi. Khi các nền tảng lớn như Aave và Curve ra mắt stablecoin riêng, cuộc chơi sẽ càng hấp dẫn hơn.

Dưới đây là phiên bản tiếng Việt chuyên nghiệp của phần mô tả bạn yêu cầu, phù hợp để đưa vào file `README.md`:

---

## 🪙 Decentralized Stablecoin (DSC)

### Tổng quan

**Decentralized Stablecoin (DSC)** là một giao thức stablecoin phi tập trung, được thế chấp bằng tài sản ngoại sinh (exogenous collateral), với mục tiêu duy trì **giá trị ổn định tương đối**, được **neo giá theo Đô la Mỹ (USD)**.

### Đặc điểm chính

- **Neo giá theo USD**  
  DSC được thiết kế để duy trì tỷ lệ 1:1 với đồng USD, sử dụng cơ chế phi tập trung kết hợp với tài sản thế chấp từ crypto.

- **Tài sản thế chấp ngoại sinh**  
  Chỉ chấp nhận các token được bao bọc từ tài sản bên ngoài:
  - **wETH** (Wrapped Ether)
  - **wBTC** (Wrapped Bitcoin)

- **Cơ chế ổn định phi tập trung**  
  Việc mint và burn DSC được điều khiển bằng một **thuật toán tự động**, đảm bảo rằng:
  - Người dùng chỉ có thể **mint khi có đủ tài sản thế chấp**
  - Token có thể được **burn để giảm cung**, giúp duy trì giá ổn định

- **Sử dụng Chainlink Price Feeds**  
  Dữ liệu giá được cập nhật theo thời gian thực thông qua **Oracle của Chainlink**, cho phép chuyển đổi an toàn giữa:
  - ETH → USD  
  - BTC → USD

### Mục tiêu

Tạo ra một tài sản kỹ thuật số ổn định, phi tập trung, có thể được sử dụng rộng rãi trong các ứng dụng DeFi — minh bạch, không cần sự tin tưởng, và gắn liền với hệ sinh thái crypto.

---