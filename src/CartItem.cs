using System;

namespace WebLinhKien_Trangvpt
{
    public class CartItem
    {
        public int MaSP { get; set; }

        public string TenSP { get; set; }

        public int Gia { get; set; }

        public int SoLuong { get; set; }

        // THÊM HÌNH 
        public string HinhAnh { get; set; }

        // TỰ ĐỘNG TÍNH
        public int ThanhTien
        {
            get { return Gia * SoLuong; }
        }
    }
}