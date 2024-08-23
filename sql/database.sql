CREATE DATABASE IF NOT EXISTS minitest3;
USE minitest3;
drop database minitest3;

CREATE TABLE IF NOT EXISTS VatTu (
                                     id INT AUTO_INCREMENT UNIQUE,
                                     ma_vat_tu VARCHAR(50),
    ten_vat_tu VARCHAR(50),
    don_vi_tinh VARCHAR(3),
    gia_tien DOUBLE,
    PRIMARY KEY (ma_vat_tu)
    );

CREATE TABLE IF NOT EXISTS NhaCungCap (
                                          id INT AUTO_INCREMENT UNIQUE,
                                          ma_nha_cung_cap VARCHAR(20),
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(20),
    PRIMARY KEY (ma_nha_cung_cap)
    );

CREATE TABLE IF NOT EXISTS TonKho (
                                      id INT AUTO_INCREMENT UNIQUE,
                                      ma_vat_tu VARCHAR(50),
    so_luong_dau INT,
    tong_so_nhap INT,
    tong_so_xuat INT,
    FOREIGN KEY (ma_vat_tu)
    REFERENCES VatTu (ma_vat_tu)
    ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS DonHang (
                                       id INT AUTO_INCREMENT UNIQUE,
                                       ma_don_hang VARCHAR(20),
    ma_nha_cung_cap VARCHAR(20),
    ngay_dat DATE,
    PRIMARY KEY (ma_don_hang),
    FOREIGN KEY (ma_nha_cung_cap)
    REFERENCES NhaCungCap (ma_nha_cung_cap)
    ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS ChiTietDonHang (
                                              id INT AUTO_INCREMENT PRIMARY KEY,
                                              ma_don_hang VARCHAR(20),
    ma_vat_tu VARCHAR(20),
    so_luong_dat INT,
    FOREIGN KEY (ma_don_hang)
    REFERENCES DonHang (ma_don_hang),
    FOREIGN KEY (ma_vat_tu)
    REFERENCES VatTu (ma_vat_tu)
    );

CREATE TABLE IF NOT EXISTS PhieuXuat (
                                         id INT AUTO_INCREMENT UNIQUE,
                                         so_phieu_xuat VARCHAR(20),
    ngay_xuat DATE,
    ten_khach_hang VARCHAR(100),
    PRIMARY KEY (so_phieu_xuat)
    );

CREATE TABLE IF NOT EXISTS PhieuNhap (
                                         id INT AUTO_INCREMENT UNIQUE,
                                         so_phieu_nhap VARCHAR(20),
    ma_don_hang VARCHAR(20),
    ngay_nhap DATE,
    PRIMARY KEY (so_phieu_nhap),
    FOREIGN KEY (ma_don_hang)
    REFERENCES DonHang (ma_don_hang)
    ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS ChiTietPhieuNhap (
                                                id INT AUTO_INCREMENT UNIQUE,
                                                so_phieu_nhap VARCHAR(20),


    ma_vat_tu VARCHAR(20),
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    ghi_chu VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (so_phieu_nhap)
    REFERENCES PhieuNhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
    REFERENCES VatTu (ma_vat_tu)
    );


CREATE TABLE IF NOT EXISTS ChiTietPhieuXuat (
                                                id INT AUTO_INCREMENT,
                                                so_phieu_xuat varchar(20),
    ma_vat_tu varchar(20),
    so_luong_xuat INT,
    don_gia_xuat DOUBLE,
    ghi_chu VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (so_phieu_xuat)
    REFERENCES PhieuXuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
    REFERENCES VatTu (ma_vat_tu)
    );

###########################################
INSERT INTO VatTu (ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien) VALUES
                                                                     ('VT101', 'Flying Car', 'c', 10000),
                                                                     ('VT102', 'Jet Pack', 'c', 15000),
                                                                     ('VT103', 'Hoverboard', 'c', 8000),
                                                                     ('VT104', 'Teleportation Device', 'c', 20000),
                                                                     ('VT105', 'Invisibility Cloak', 'c', 12000),
                                                                     ('VT106', 'Laser Gun', 'c', 5000),
                                                                     ('VT107', 'Time Machine', 'c', 30000),
                                                                     ('VT108', 'Anti-Gravity Boots', 'c', 7000),
                                                                     ('VT109', 'Nano Suit', 'c', 25000),
                                                                     ('VT110', 'Quantum Computer', 'c', 35000);

INSERT INTO NhaCungCap (ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) VALUES
                                                                                       ('NCC001', 'Vinamilk USA', 'number 10, Haland Strt, NY, USA', '094-884-4958'),
                                                                                       ('NCC002', 'Nestle Canada', '12 Queen Street, Toronto, Canada', '905-123-4567'),
                                                                                       ('NCC003', 'Danone France', '34 Rue de la Paix, Paris, France', '33-1-2345-6789');

INSERT INTO TonKho (ma_vat_tu, so_luong_dau, tong_so_nhap, tong_so_xuat) VALUES
                                                                             ('VT101', 20, 3, 4),
                                                                             ('VT102', 15, 5, 2),
                                                                             ('VT103', 10, 2, 1),
                                                                             ('VT101', 25, 8, 6),
                                                                             ('VT105', 30, 10, 7);

INSERT INTO DonHang (ma_nha_cung_cap, ma_don_hang, ngay_dat) VALUES
                                                                 ('NCC001', 'ORD001', '2012-12-01'),
                                                                 ('NCC002', 'ORD002', '2013-01-15'),
                                                                 ('NCC003', 'ORD003', '2013-02-20'),
                                                                 ('NCC001', 'ORD004', '2013-03-10'),
                                                                 ('NCC003', 'ORD005', '2013-04-05');

INSERT INTO PhieuXuat (so_phieu_xuat, ngay_xuat, ten_khach_hang) VALUES
                                                                     ('SPX001', '2012-05-08', 'Ben Affleck'),
                                                                     ('SPX002', '2013-06-15', 'Matt Damon'),
                                                                     ('SPX003', '2014-07-20', 'Jennifer Garner');

INSERT INTO PhieuNhap (so_phieu_nhap, ma_don_hang, ngay_nhap) VALUES
                                                                  ('SPN001', 'ORD001', '2012-08-08'),
                                                                  ('SPN002', 'ORD005', '2013-09-10'),
                                                                  ('SPN003', 'ORD004', '2014-10-15');

INSERT INTO ChiTietDonHang (ma_don_hang, ma_vat_tu, so_luong_dat) VALUES
                                                                      ('ORD001', 'VT101', 7),
                                                                      ('ORD002', 'VT102', 5),
                                                                      ('ORD004', 'VT103', 12),
                                                                      ('ORD004', 'VT104', 8),
                                                                      ('ORD005', 'VT105', 15);

INSERT INTO ChiTietPhieuNhap (so_phieu_nhap, ma_vat_tu,so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
                                                                                                 ('SPN001', 'VT104', 10, 8, 'Something funny happened during unpacking!'),
                                                                                                 ('SPN002', 'VT102',11, 10, 'Our delivery team made a dance party with your package!'),
                                                                                                 ('SPN003', 'VT103', 15,7, 'The package was so excited it almost jumped out of the truck!'),
                                                                                                 ('SPN001', 'VT104', 7,9, 'We added extra bubble wrap for some popping fun!'),
                                                                                                 ('SPN003', 'VT105', 10,12, 'Your shipment is practicing its stand-up comedy!'),
                                                                                                 ('SPN002', 'VT106', 21, 6, 'We think your package might be telling jokes!');

INSERT INTO ChiTietPhieuXuat (so_phieu_xuat, ma_vat_tu, so_luong_xuat, don_gia_xuat, ghi_chu) VALUES
                                                                                                  ('SPX001', 'VT101', 8, 8.5, 'Something funny happened during packing!'),
                                                                                                  ('SPX002', 'VT102', 10, 7.0, 'The goods might come with a surprise dance move!'),
                                                                                                  ('SPX003', 'VT103', 5, 9.2, 'We added extra stickers just for fun!'),
                                                                                                  ('SPX001', 'VT104', 12, 6.5, 'Your items are practicing their juggling skills!'),
                                                                                                  ('SPX002', 'VT105', 7, 8.0, 'Expect a package that might sing!'),
                                                                                                  ('SPX003', 'VT106', 9, 8.7, 'Your shipment decided to take a scenic route!');
CREATE VIEW `vw_CTPNHAP` AS
SELECT
    so_phieu_nhap,
    ma_vat_tu,
    so_luong_nhap,
    don_gia_nhap,
    so_luong_nhap * don_gia_nhap AS tien_nhap
FROM
    ChiTietPhieuNhap;

CREATE VIEW `vw_CTPNHAP_VT` AS
SELECT
    so_phieu_nhap,
    ctpn.ma_vat_tu,
    ten_vat_tu,
    so_luong_nhap,
    don_gia_nhap,
    so_luong_nhap * don_gia_nhap AS tien_nhap
FROM
    ChiTietPhieuNhap AS ctpn,
    vattu AS vt
WHERE
    ctpn.ma_vat_tu = vt.ma_vat_tu;

CREATE VIEW `vw_CTPN_VT_PN` AS
SELECT
    ctpn.so_phieu_nhap,
    pn.ngay_nhap,
    pn.ma_don_hang,
    ctpn.ma_vat_tu,
    ten_vat_tu,
    so_luong_nhap,
    don_gia_nhap,
    so_luong_nhap * don_gia_nhap AS tien_nhap
FROM
    ChiTietPhieuNhap AS ctpn,
    PhieuNhap AS pn,
    vattu AS vt
WHERE
    ctpn.ma_vat_tu = vt.ma_vat_tu
  AND ctpn.so_phieu_nhap = pn.so_phieu_nhap;

CREATE VIEW `vw_CTPNHAP_VT_PN_DH` AS
SELECT
    ctpn.so_phieu_nhap,
    pn.ngay_nhap,
    pn.ma_don_hang ma_nha_cung_cap,
    ctpn.ma_vat_tu,
    ten_vat_tu,
    so_luong_nhap,
    don_gia_nhap,
    so_luong_nhap * don_gia_nhap AS tien_nhap
FROM
    ChiTietPhieuNhap AS ctpn,
    PhieuNhap AS pn,
    vattu AS vt,
    nhacungcap AS ncc,
    donhang AS dh
WHERE
    ctpn.ma_vat_tu = vt.ma_vat_tu
  AND ctpn.so_phieu_nhap = pn.so_phieu_nhap
  AND pn.ma_don_hang = dh.ma_don_hang
  AND dh.ma_nha_cung_cap = ncc.ma_nha_cung_cap;


CREATE VIEW `vw_CTPNHAP_loc` AS
SELECT
    so_phieu_nhap, ma_vat_tu, so_luong_nhap
FROM
    ChiTietPhieuNhap
WHERE
    so_luong_nhap > 5;

CREATE VIEW `vw_CTPNHAP_VT_loc` AS
SELECT
    so_phieu_nhap,
    ctpn.ma_vat_tu,
    ten_vat_tu,
    so_luong_nhap,
    don_gia_nhap,
    so_luong_nhap * don_gia_nhap AS tien_nhap
FROM
    ChiTietPhieuNhap AS ctpn,
    vattu AS vt
WHERE
    ctpn.ma_vat_tu = vt.ma_vat_tu
  AND don_vi_tinh = 'bo';

CREATE VIEW `vw_CTPXUAT` AS
SELECT
    so_phieu_xuat,
    ma_vat_tu,
    so_luong_xuat,
    don_gia_xuat,
    so_luong_xuat * don_gia_xuat AS tien_xuat
FROM
    chitietphieuxuat;

create view `vw_CTPXUAT_VT` as
SELECT
    so_phieu_xuat,
    ctpx.ma_vat_tu,
    ten_vat_tu,
    so_luong_xuat,
    don_gia_xuat,
    so_luong_xuat * don_gia_xuat AS tien_xuat
FROM
    chitietphieuxuat AS ctpx,
    vattu AS vt
WHERE
    ctpx.ma_vat_tu = vt.ma_vat_tu;