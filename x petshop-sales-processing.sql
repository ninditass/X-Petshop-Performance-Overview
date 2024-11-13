WITH Kategori_Waktu AS (
    SELECT
        CASE
            WHEN PARSE_TIME('%H:%M:%S', CONCAT(`Waktu`, ':00')) BETWEEN TIME '07:00:00' AND TIME '12:00:00' THEN 'Pagi'
            WHEN PARSE_TIME('%H:%M:%S', CONCAT(`Waktu`, ':00')) BETWEEN TIME '12:01:00' AND TIME '16:00:00' THEN 'Siang'
            WHEN PARSE_TIME('%H:%M:%S', CONCAT(`Waktu`, ':00')) BETWEEN TIME '16:01:00' AND TIME '19:00:00' THEN 'Sore'
            WHEN PARSE_TIME('%H:%M:%S', CONCAT(`Waktu`, ':00')) BETWEEN TIME '19:01:00' AND TIME '21:00:00' THEN 'Malam'
            ELSE 'Di luar waktu yang ditentukan'
        END AS Waktu_Kategori,
        *
    FROM `pupet-sales.Pupet_July_October.Sales_New`
)

SELECT 
    `No Transaksi`,
    `Tanggal`,
    `Waktu`,
    Waktu_Kategori,
    `Operator`, 
    `Tipe Penjualan`,
    `Metode Pembayaran`,
    `Detail Produk`,
    `Banyak Penjualan`,
    `Penjualan Kotor`,
    `Penjualan Bersih`,
    `Total Uang Diterima`
FROM Kategori_Waktu;