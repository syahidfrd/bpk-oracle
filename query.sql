-- 1. Melihat data produk/panen/etc.
SELECT * FROM tb_produk;

-- 2. Melihat data produk lengkap dengan provinsinya
SELECT * FROM tb_produk
JOIN tb_provinsi ON tb_provinsi.id = tb_produk.provinsi_id;

-- 3. Melihat data produk pada provinsi tertentu
-- menggunakan parameter id
SELECT * FROM tb_produk
WHERE provinsi_id = 1;

 -- menggunakan parameter nama provinsi
SELECT pr.id, pr.nama, pr.kategori, pr.provinsi_id FROM tb_produk pr
JOIN tb_provinsi pv ON pv.id = pr.provinsi_id
WHERE pv.nama = 'Jawa Tengah';

-- 4. Melihat data produk berdasarkan category
SELECT * FROM tb_produk
WHERE kategori = 'peternakan';

-- 5. Melihat data petani pada produk tertentu
SELECT * FROM tb_produk_petani
WHERE produk_id = 1;

-- menampilkan nama petaninya
SELECT p.id, p.nama FROM tb_produk_petani pp
JOIN tb_petani p ON p.id = pp.petani_id
WHERE pp.produk_id = 1;

-- 6. Melihat data total produk yg dikelola tiap petani
SELECT petani_id, COUNT(id) AS total FROM tb_produk_petani
GROUP BY petani_id

-- sekaligus menampilakn nama petaninya
SELECT p.nama, COUNT(pp.id) AS total FROM tb_produk_petani pp
JOIN tb_petani p ON p.id = pp.petani_id
GROUP BY p.nama;

-- 7. Melihat data produk yang dikelola oleh petani tertentu
SELECT * FROM tb_produk_petani
WHERE petani_id = 1

 -- menampilkan nama produknya
SELECT p.id, p.nama FROM tb_produk_petani pp
JOIN tb_produk p ON p.id = pp.produk_id
WHERE pp.petani_id = 1;

-- 8. Melihat data panen produk pada tahun tertentu
SELECT * FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE EXTRACT(YEAR FROM p.tanggal) = 2016;

-- 9. Melihat data panen per produk
SELECT * FROM tb_panen
WHERE produk_id = 1;

-- 10. Melihat data panen per provinsi
SELECT * FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE pr.provinsi_id = 2;

 -- Menggunakan parameter nama provinsi
SELECT p.id, p.produk_id, p.tanggal, p.total_kg FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id JOIN tb_provinsi pv ON pv.id = pr.provinsi_id
WHERE pv.nama = 'Jawa Barat';

-- 11. Melihat data panen per provinsi dengan range tahun
SELECT * FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE pr.provinsi_id = 2 AND (EXTRACT(YEAR FROM p.tanggal) BETWEEN 2016 AND 2018);

-- 12. Melihat total panen per produk pada tahun tertentu
SELECT pr.nama, COUNT(p.id) AS total FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE EXTRACT(YEAR FROM p.tanggal) = 2018
GROUP BY pr.nama

-- 13. Melihat jumlah kg panen pada produk tertentu berdasarkan tahun
SELECT SUM(total_kg) AS total FROM tb_panen
WHERE produk_id = 7 AND EXTRACT(YEAR FROM tanggal) = 2018;

-- 14. Melihat data panen pada kategori dan provinsi tertentu
SELECT * FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE pr.kategori = 'peternakan' AND pr.provinsi_id = 2

-- 15. Melihat total kg panen berdasarkan kategori dan tahun tertentu
SELECT SUM(total_kg) AS total FROM tb_panen p
JOIN tb_produk pr ON pr.id = p.produk_id
WHERE pr.kategori = 'perkebunan' AND EXTRACT(YEAR FROM tanggal) = 2018;

-- 16. Mencari data panen dengan range tanggal
SELECT * FROM tb_panen
WHERE tanggal BETWEEN TO_DATE('21-03-2015', 'DD/MM/YYYY') AND TO_DATE('12-08-2015', 'DD/MM/YYYY');

-- 17. Menampilkan total produk per kategori
SELECT kategori, COUNT(id) AS total FROM tb_produk
GROUP BY kategori;