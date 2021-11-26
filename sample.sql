CREATE TABLE tb_provinsi (
    id NUMBER NOT NULL,
    nama VARCHAR2(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_provinsi (id, nama) VALUES (1, 'Jawa Tengah');
INSERT INTO tb_provinsi (id, nama) VALUES (2, 'Jawa Timur');
INSERT INTO tb_provinsi (id, nama) VALUES (3, 'Jawa Barat');

CREATE TABLE tb_produk (
    id NUMBER NOT NULL,
    nama VARCHAR2(100) NOT NULL,
    kategori VARCHAR2(100) NOT NULL,
    provinsi_id NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (provinsi_id) REFERENCES tb_provinsi (id)
);

INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (1, 'Padi', 'perkebunan', 1);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (2, 'Bayam', 'perkebunan', 3);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (3, 'Sawit', 'perkebunan', 2);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (4, 'Tomat', 'perkebunan', 1);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (5, 'Jagung', 'perkebunan', 3);

INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (6, 'Lele', 'peternakan', 1);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (7, 'Bandeng', 'peternakan', 3);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (8, 'Mujair', 'peternakan', 2);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (9, 'Kambing', 'peternakan', 1);
INSERT INTO tb_produk (id, nama, kategori, provinsi_id) VALUES (10, 'Sapi', 'peternakan', 3);

CREATE TABLE tb_petani (
    id NUMBER NOT NULL,
    nama VARCHAR2(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO tb_petani (id, nama) VALUES (1, 'Budi');
INSERT INTO tb_petani (id, nama) VALUES (2, 'Ahmad');
INSERT INTO tb_petani (id, nama) VALUES (3, 'Joko');
INSERT INTO tb_petani (id, nama) VALUES (4, 'Siti');
INSERT INTO tb_petani (id, nama) VALUES (5, 'Rohmat');
INSERT INTO tb_petani (id, nama) VALUES (6, 'Ayu');

CREATE TABLE tb_produk_petani (
    id NUMBER NOT NULL,
    produk_id NUMBER NOT NULL,
    petani_id NUMBER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (produk_id) REFERENCES tb_produk (id),
    FOREIGN KEY (petani_id) REFERENCES tb_petani (id)
);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (1, 1, 1);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (2, 1, 3);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (3, 1, 4);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (4, 1, 6);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (5, 2, 2);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (6, 2, 5);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (7, 3, 1);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (8, 3, 6);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (9, 3, 2);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (10, 4, 5);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (11, 5, 2);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (12, 5, 4);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (13, 5, 1);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (14, 5, 3);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (15, 6, 1);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (16, 7, 2);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (17, 8, 5);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (18, 8, 1);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (19, 9, 2);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (20, 9, 5);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (21, 9, 6);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (22, 9, 3);

INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (23, 10, 6);
INSERT INTO tb_produk_petani (id, produk_id, petani_id) VALUES (24, 10, 1);

CREATE TABLE tb_panen (
    id NUMBER NOT NULL,
    produk_id NUMBER NOT NULL,
    total_kg NUMBER NOT NULL,
    tanggal DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (produk_id) REFERENCES tb_produk (id)
);

INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (1, 1, 10, TO_DATE('01-01-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (2, 2, 50, TO_DATE('04-02-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (3, 3, 70, TO_DATE('01-03-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (4, 4, 20, TO_DATE('21-03-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (5, 5, 10, TO_DATE('01-04-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (6, 6, 40, TO_DATE('15-04-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (7, 7, 10, TO_DATE('25-04-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (8, 8, 90, TO_DATE('01-05-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (9, 9, 30, TO_DATE('17-06-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (10, 10, 10, TO_DATE('01-07-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (11, 1, 70, TO_DATE('13-08-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (12, 2, 80, TO_DATE('07-09-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (13, 3, 20, TO_DATE('11-09-2015', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (14, 4, 10, TO_DATE('09-10-2015', 'DD/MM/YYYY'));

INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (15, 1, 30, TO_DATE('01-01-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (16, 2, 50, TO_DATE('01-02-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (17, 3, 20, TO_DATE('12-03-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (18, 4, 50, TO_DATE('05-04-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (19, 5, 10, TO_DATE('21-04-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (20, 6, 90, TO_DATE('01-05-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (21, 7, 10, TO_DATE('22-06-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (22, 8, 20, TO_DATE('01-07-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (23, 9, 20, TO_DATE('28-08-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (24, 10, 40, TO_DATE('01-09-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (25, 1, 30, TO_DATE('15-09-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (26, 2, 10, TO_DATE('23-09-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (27, 3, 20, TO_DATE('01-10-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (28, 5, 10, TO_DATE('10-10-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (29, 5, 20, TO_DATE('01-11-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (30, 4, 10, TO_DATE('01-12-2016', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (31, 7, 10, TO_DATE('18-12-2016', 'DD/MM/YYYY'));

INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (32, 1, 10, TO_DATE('05-01-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (33, 2, 40, TO_DATE('06-02-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (34, 3, 60, TO_DATE('19-02-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (35, 4, 50, TO_DATE('05-03-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (36, 5, 10, TO_DATE('15-03-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (37, 6, 90, TO_DATE('01-04-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (38, 7, 20, TO_DATE('01-05-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (39, 8, 20, TO_DATE('25-06-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (40, 9, 20, TO_DATE('01-07-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (41, 10, 20, TO_DATE('20-08-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (42, 1, 10, TO_DATE('05-09-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (43, 2, 10, TO_DATE('15-09-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (44, 3, 20, TO_DATE('20-09-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (45, 5, 40, TO_DATE('01-10-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (46, 5, 20, TO_DATE('03-11-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (47, 4, 10, TO_DATE('10-11-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (48, 7, 50, TO_DATE('05-12-2017', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (49, 9, 10, TO_DATE('29-12-2017', 'DD/MM/YYYY'));

INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (50, 1, 20, TO_DATE('01-01-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (51, 2, 30, TO_DATE('01-02-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (52, 3, 60, TO_DATE('07-03-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (53, 4, 30, TO_DATE('20-03-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (54, 5, 10, TO_DATE('12-04-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (55, 6, 10, TO_DATE('01-05-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (56, 7, 10, TO_DATE('14-05-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (57, 8, 10, TO_DATE('11-06-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (58, 9, 30, TO_DATE('01-07-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (59, 10, 20, TO_DATE('21-08-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (60, 4, 40, TO_DATE('01-09-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (61, 8, 70, TO_DATE('14-10-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (62, 1, 10, TO_DATE('20-10-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (63, 5, 40, TO_DATE('01-11-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (64, 1, 20, TO_DATE('10-11-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (65, 2, 30, TO_DATE('09-12-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (66, 10, 10, TO_DATE('24-12-2018', 'DD/MM/YYYY'));
INSERT INTO tb_panen (id, produk_id, total_kg, tanggal) VALUES (67, 10, 10, TO_DATE('26-12-2018', 'DD/MM/YYYY'));