Web linh kiện máy tính  
ASPNET-DK24TTK2-vuphuongthaotrang-weblinhkien  

Giới thiệu  

Thông tin sinh viên  
- Họ tên: Vũ Phương Thảo Trang  
- MSSV: 170124112  
- Lớp: DK24TTK2  
- Email: trangvpt041292@tvu-onschool.edu.vn  

// Ngày 02/05/2026 thực hiện //  

Các chức năng đã thực hiện  

- Xây dựng trang danh sách sản phẩm (Default):
  - Hiển thị dữ liệu sản phẩm từ database  
  - Trình bày thông tin gồm: tên, giá, loại, hình ảnh  

- Xây dựng trang chi tiết sản phẩm (ChiTiet):
  - Hiển thị đầy đủ thông tin sản phẩm khi người dùng chọn  
  - Lấy dữ liệu theo mã sản phẩm (MaSP)  

- Xây dựng chức năng tìm kiếm và lọc:
  - Tìm kiếm sản phẩm theo tên  
  - Lọc sản phẩm theo loại (Loai)  
  - Kết hợp tìm kiếm và lọc thông qua QueryString  

- Xây dựng kết nối dữ liệu:
  - Tạo lớp ketnoi để thực hiện truy vấn database  
  - Sử dụng DataTable để xử lý và hiển thị dữ liệu  

Cấu trúc thư mục:  

src/  
├── Default.aspx  
├── Default.aspx.cs  
├── ChiTiet.aspx  
├── ChiTiet.aspx.cs  
├── ketnoi.cs  
├── Web.config  
├── image/  
└── DBLinhKien.bak  
- Kết quả đạt được:
  - Hiển thị sản phẩm thành công từ cơ sở dữ liệu  
  - Xem được chi tiết từng sản phẩm  
  - Tìm kiếm và lọc hoạt động đúng  
  - Hệ thống bắt đầu hình thành giao diện bán hàng cơ bản  

// Ngày 03/05/2026 thực hiện //  

Các chức năng đã thực hiện  

- Xây dựng chức năng đăng ký tài khoản:
  - Cho phép người dùng tạo tài khoản mới  
  - Kiểm tra trùng username trước khi đăng ký  

- Xây dựng chức năng đăng nhập và đăng xuất:
  - Xác thực tài khoản từ cơ sở dữ liệu  
  - Lưu thông tin đăng nhập bằng Session  
  - Cho phép đăng xuất và xoá Session  

- Kết quả đạt được:
  - Hoàn thiện hệ thống đăng nhập, đăng ký và đăng xuất  

// Ngày 04/05/2026 thực hiện //  

Các chức năng đã thực hiện  

- Xây dựng chức năng quản lý sản phẩm:
  - Hiển thị danh sách sản phẩm  
  - Thêm sản phẩm mới  
  - Chỉnh sửa thông tin sản phẩm  
  - Xoá sản phẩm  

- Phân quyền người dùng:
  - Chỉ tài khoản có role "admin" mới được truy cập và sử dụng chức năng quản lý sản phẩm  

- Xây dựng chức năng giỏ hàng (Cart):
  - Thêm sản phẩm vào giỏ hàng  
  - Tăng số lượng sản phẩm khi thêm trùng  
  - Lưu giỏ hàng bằng Session thông qua List<CartItem>  

- Xây dựng class CartItem:
  - Lưu thông tin sản phẩm trong giỏ gồm: MaSP, TenSP, Gia, SoLuong, HinhAnh  

- Hiển thị số lượng sản phẩm trong giỏ hàng:
  - Tổng số lượng sản phẩm được hiển thị trên header  

- Xây dựng chức năng thanh toán:
  - Người dùng nhập thông tin (Tên, SĐT, Địa chỉ, Email)  
  - Lưu thông tin vào bảng DonHang  
  - Xoá giỏ hàng sau khi thanh toán  

- Hoàn thiện luồng xử lý:
  - Người dùng chọn sản phẩm → thêm vào giỏ → xem giỏ hàng → thanh toán  

- Kết quả đạt được:
  - Hoàn thành các chức năng chính của website:
    - Đăng nhập / đăng ký  
    - Quản lý sản phẩm  
    - Hoàn thiện hệ thống đăng nhập và phân quyền  
    - Cho phép quản trị viên quản lý sản phẩm trực tiếp trên website  
    - Đảm bảo dữ liệu được kiểm soát theo quyền người dùng  
    - Giỏ hàng  
    - Thanh toán  

// Ngày 05/05/2026 thực hiện //
Các chức năng đã thực hiện

Xây dựng chức năng quản lý đơn hàng (QLDonHang):
Hiển thị danh sách đơn hàng từ database
Hiển thị thông tin khách hàng: Tên, SĐT, Địa chỉ, Email
Xem danh sách sản phẩm trong từng đơn hàng

Phân quyền truy cập:
Chỉ tài khoản có role "admin" mới được truy cập trang quản lý đơn hàng

Hoàn thiện luồng hoạt động hệ thống:

Người dùng:
Xem sản phẩm → xem chi tiết → thêm vào giỏ hàng → thanh toán

Hệ thống:
Lưu thông tin đơn hàng vào database
Lưu danh sách sản phẩm tương ứng với từng đơn hàng

Quản trị viên:
Đăng nhập → quản lý sản phẩm → xem đơn hàng

Kết quả đạt được:
Hoàn thiện đầy đủ chức năng của website:
- Đăng nhập / đăng ký
- Quản lý sản phẩm
- Giỏ hàng
- Thanh toán
- Quản lý đơn hàng

Hệ thống hoạt động ổn định, dữ liệu được xử lý và lưu trữ chính xác

Ghi chú:
Đồ án đã hoàn thiện các chức năng chính
Sẵn sàng viết báo cáo tổng kết

