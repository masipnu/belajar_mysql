/* ============================== */
/*               BAB 3            */
/* ------------------------------ */
/* Mendefinisikan Data dengan DML */
/* ------------------------------ */
/*      Create - Alter - Drop     */
/* ============================== */

-- Membuat database "buku_db"
CREATE DATABASE buku_db;

-- Mengaktifkan database "buku_db"
USE buku_db;

-- Membuat tabel kategori
CREATE TABLE kategori(
kategori_id int not null auto_increment,
kategori_nama varchar(25),
primary key(kategori_id)
);

-- Membuat tabel pengarang
CREATE TABLE pengarang(
pengarang_id char(3) not null,
pengarang_nama varchar(30),
primary key(pengarang_id)
);

-- Membuat tabel penerbit
CREATE TABLE penerbit(
penerbit_id char(4) not null,
penerbit_nama varchar(50),
primary key(penerbit_id)
);

-- Membuat tabel buku
CREATE TABLE buku(
buku_isbn char(13) not null,
buku_judul varchar(75),
penerbit_id char(4),
buku_tglterbit date,
buku_jmlhalaman int,
buku_deskripsi text,
buku_harga decimal,
primary key(buku_isbn),
foreign key(penerbit_id)
	references penerbit(penerbit_id)
);

-- Membuat tabel 'link_buku_pengarang'
CREATE TABLE link_buku_pengarang(
buku_isbn char(13) not null,
pengarang_id char(3) not null,
primary key(buku_isbn, pengarang_id),
foreign key(buku_isbn)
	references buku(buku_isbn),
foreign key(pengarang_id)
	references pengarang(pengarang_id)
);

-- Membuat tabel 'link_buku_kategori'
CREATE TABLE link_buku_kategori(
buku_isbn char(13) not null,
kategori_id int not null,
primary key(buku_isbn, kategori_id),
foreign key(buku_isbn)
	references buku(buku_isbn),
foreign key(kategori_id)
	references kategori(kategori_id)
);

/* -------------------------- */
/*      Query Tambahan        */
/* -------------------------- */

-- Mengubah nama tabel
ALTER TABLE kategori RENAME TO kategori_buku;

-- Menambah kolom
ALTER TABLE buku ADD COLUMN buku_sinopsis text;

-- Mengubah Kolom
ALTER TABLE buku
	CHANGE buku_isbn buku_id char(15);

-- Menghapus kolom
ALTER TABLE buku DROP buku_sinopsis;

-- Menambah primary key
ALTER TABLE buku
	ADD primary key(buku_judul);

-- Menambah foreign key
ALTER TABLE link_buku_kategori
	ADD foreign key(buku_isbn)
	references buku(buku_isbn);

-- Menghapus primary key
ALTER TABLE buku DROP primary key;

-- Menghapus foreign key
ALTER TABLE fk_link_buku_kategori;

-- Menambah indeks
ALTER TABLE buku ADD INDEX idx_judul(buku_judul);

-- Menghapus indeks
ALTER TABLe buku DROP INDEX idx_judul;

-- Menghapus Tabel
DROP TABLE IF EXIST link_buku_kategori;
DROP TABLE link_buku_kategori, link_buku_pengarang;


/* =========================== */
/*            BAB 4            */
/* --------------------------- */
/*  Manipulasi Data dengan DML */
/* --------------------------- */
/*   Insert - Update - Delete  */
/* =========================== */

-- Memasukkan data tabel 'kategori'
INSERT INTO kategori (kategori_nama) VALUES
('Database'),
('Desain Grafis'),
('Jaringan Komputer'),
('Pemrograman'),
('Web dan Internet'),
('Office Application');

-- Memasukkan data tabel 'pengarang'
INSERT INTO pengarang VALUES
('P01','Andi Setiawan'),
('P02','Rudi Wicaksono'),
('P03','Beni Tito'),
('P04','Prasetya'),
('P05','Erik Rusdianto'),
('P06','Rosdiana'),
('P07','Fredi Hidayat'),
('P08','Hasanudin'),
('P09','Ahmad hanafi'),
('P10','Iwan Gunardi'),
('P11','Iman Teguh'),
('P12','Abdul Ghozali'),
('P13','Tegar Sanjaya');

-- Memasukkan data tabel 'penerbit'
INSERT INTO penerbit VALUES
('PB01','Angkasa Raya'),
('PB02','Cahaya Ilmu Persada'),
('PB03','Sinar Ilmu Perkasa'),
('PB04','Intan'),
('PB05','Sinar Raya'),
('PB06','Informatika'),
('PB07','Tiga Sekawan'),
('PB08','Cipta Ilmu');

-- Memasukkan data tabel 'buku'
INSERT INTO buku VALUES
('222-34222-1-0','Belajar Photoshop','PB01','2019/07/02',300,NULL,42000),
('222-34222-1-1','Panduan CorelDRAW','PB02','2020/03/15',400,NULL,55000),
('979-96446-9-0','Belajar SQL','PB06','2019/10/12',346,NULL,45000),
('979-96446-9-1','Panduan Basis Data','PB01','2017/03/02',257,NULL,37000),
('979-96446-9-2','Perancangan Sistem','PB03','2013/09/20',403,NULL,37000),
('979-96446-9-3','Microsoft Access','PB06','2015/07/13',400,NULL,48500),
('888-96771-3-0','Pemrograman Pascal','PB08','2014/11/01',350,NULL,50000),
('888-96771-3-1','Pemrograman Java','PB06','2017/01/23',450,NULL,72000),
('888-96771-3-2','Pemrograman C untuk Hardware','PB05','2016/12/25',398,NULL,47000),
('888-96771-3-3','Panduan C++','PB06','2015/07/15',490,NULL,65000),
('888-96771-3-4','Belajar Delphi','PB05','2018/08/11',328,NULL,50000),
('888-96771-3-5','Visual Basic','PB02','2017/10/14',250,NULL,50000),
('666-96771-2-0','Panduan Membangun Jaringan TCP/IP','PB08','2016/08/02',200,NULL,60000),
('666-96771-2-1','Implementasi TCP/IP di Linux','PB08','2018/11/21',230,NULL,350000),
('777-76723-5-0','Belajar PHP 8','PB07','2020/05/02',600,NULL,95000),
('777-76723-5-1','Aplikasi Web dengan Python','PB07','2014/08/01',180,NULL,30000),
('777-76723-5-2','Internet Marketing','PB07','2017/01/24',150,NULL,38500),
('777-76723-5-3','Panduan Menjadi Youtuber','PB07','2017/01/24','243',NULL,38500),
('999-11555-2-0','Microsoft Power Point','PB06','2018/11/23',300,NULL,57500),
('999-11555-2-1','Microsoft Word','PB04','2017/12/01',270,NULL,60000);

-- Memasukkan data tabel 'link_buku_pengarang'
INSERT INTO link_buku_pengarang VALUES
('222-34222-1-0','P01'),
('222-34222-1-1','P04'),
('666-96771-2-0','P04'),
('666-96771-2-0','P07'),
('666-96771-2-0','P06'),
('666-96771-2-1','P04'),
('666-96771-2-1','P01'),
('777-76723-5-0','P02'),
('777-76723-5-0','P04'),
('777-76723-5-1','P03'),
('777-76723-5-1','P12'),
('777-76723-5-1','P10'),
('777-76723-5-2','P13'),
('777-76723-5-3','P08'),
('777-76723-5-3','P09'),
('888-96771-3-0','P04'),
('888-96771-3-1','P02'),
('888-96771-3-1','P11'),
('888-96771-3-2','P01'),
('888-96771-3-2','P06'),
('888-96771-3-3','P02'),
('888-96771-3-4','P10'),
('888-96771-3-4','P09'),
('888-96771-3-5','P02'),
('979-96446-9-0','P11'),
('979-96446-9-0','P02'),
('979-96446-9-1','P07'),
('979-96446-9-2','P13'),
('979-96446-9-2','P10'),
('979-96446-9-2','P12'),
('979-96446-9-2','P03'),
('979-96446-9-3','P11'),
('999-11555-2-0','P11'),
('999-11555-2-0','P13'),
('999-11555-2-1','P08'),
('999-11555-2-1','P09'),
('999-11555-2-1','P10'),
('999-11555-2-1','P06');

-- Memasukkan data tabel 'link_buku_kategori'
INSERT INTO link_buku_kategori VALUES
('222-34222-1-0',2),
('222-34222-1-1',2),
('979-96446-9-0',1),
('979-96446-9-1',1),
('979-96446-9-2',1),
('979-96446-9-2',4),
('979-96446-9-3',1),
('888-96771-3-0',4),
('888-96771-3-1',4),
('888-96771-3-2',4),
('888-96771-3-3',4),
('888-96771-3-4',4),
('888-96771-3-5',4),
('666-96771-2-0',3),
('666-96771-2-1',3),
('777-76723-5-0',4),
('777-76723-5-0',5),
('777-76723-5-1',4),
('777-76723-5-1',5),
('777-76723-5-2',5),
('777-76723-5-3',5),
('999-11555-2-0',6),
('999-11555-2-1',6);


/* -------------------------- */
/*      Query Tambahan        */
/* -------------------------- */


-- Mengubah data di dalam tabel penerbit
UPDATE penerbit
	SET penerbit_nama = 'Informatika Bandung'
WHERE
	penerbit_id = 'PB06';


-- Mengubah data di dalam tabel buku
UPDATE buku
	SET buku_judul = 'Tuntunan Praktis Menggunakan Microsoft Word 2010',
		penerbit_id = 'PB02'
WHERE
	buku_isbn = '999-11555-2-1';


-- Menghapus satu row data dalam tabel
DELETE FROM buku
WHERE buku_isbn = '888-96771-3-5';


-- Menghapus seluruh row data dalam tabel
DELETE FROM buku;


-- Menghapus tabel beserta isinya, lalu mere-build ulang tabel tanpa data
TRUNCATE table buku;


/* ===================================== */
/*                  BAB 5                */
/* ------------------------------------- */
/*   Kontrol Hak Akses & Transaksi Data  */
/* ------------------------------------- */
/* TCL : Grant, Revoke, Commit, Rollback */
/* ===================================== */

-- Memberikan seluruh jenis akses pada 1 database
GRANT ALL
on buku_db.*
TO 'adi'@'localhost'
IDENTIFIED BY 's3cr3t';


-- Menampilkan hak akses yang dimiliki oleh satu user
SHOW GRANTS FOR 'adi'@'localhost';


-- Mencabut seluruh jenis akses pada 1 user
REVOKE ALL on buku_db.* FROM adi;


-- Menonaktifkan fungsi COMMIT
SET AUTOCOMMIT=0;


-- Mengaktifkan fungsi COMMIT
SET AUTOCOMMIT=1;


-- Menggunakan ROLLBACK
-- Untuk menggunakan fungsi ROLLBACK, AUTOCOMMIT harus diset OFF terlebih dahulu

SET AUTOCOMMIT=0;

CREATE TABLE test(
kode integer not null primary key,
keterangan varchar(50)
);

INSERT INTO test VALUES
(1,'Baris Pertama'),
(2,'Baris Ke dua'),
(3,'Baris ke tiga');

COMMIT;

INSERT INTO test VALUES
(4,'Baris ke empat'),
(5,'Baris ke lima'),
(6,'Baris ke enam');

ROLLBACK;


/* ===================================== */
/*                  BAB 6                */
/* ------------------------------------- */
/* 			Seleksi Data - Bagian 1 	 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */

-- Perintah SELECT
-- Menampilkan seluruh kolom dan data dalam tabel
SELECT * FROM buku;


-- Menampilkan beberapa kolom dari tabel buku
SELECT 	buku_isbn,
		buku_judul,
		penerbit_id,
		buku_tglterbit,
		buku_jmlhalaman,
		buku_deskripsi,
		buku_harga
FROM
	buku;


-- Menampilkan beberapa kolom dari tabel buku dan memberi alias
SELECT 	buku_isbn ISBN,
		buku_judul JUDUL,
		penerbit_id PENERBIT,
		buku_tglterbit TERBIT,
		buku_jmlhalaman HALAMAN,
		buku_deskripsi DESKRIPSI,
		buku_harga HARGA
FROM
	buku;


-- Menampilkan seluruh data dari beberapa kolom
SELECT buku_harga, buku_judul FROM buku;


-- Menampilkan seluruh data dari beberapa kolom dan memberi alias
SELECT buku_harga HARGA, buku_judul JUDUL FROM buku;


-- Menyertakan nama database dan tabel dalam perintah SELECT
SELECT
	buku.buku_isbn,
	buku.buku_judul,
	buku.buku_harga
FROM
	buku_db.buku;


-- Menggunakan Alias tabel
SELECT
	a.buku_isbn,
	a.buku_judul,
	a.buku_harga
FROM
	buku a;


-- Menggunakan Alias pada nama kolom
SELECT
	buku_isbn as 'ISBN',
	buku_judul as 'JUDUL BUKU',
	buku_harga as 'HARGA'
FROM
	buku;



/* Menyaring Data
-----------------------------------------------------
Data yang ditampilkan dapat disaring (filter)
berdasarkan kebutuhan informasi yang akan disajikan.
Untuk menyaring data, perlu didefinisikan kondisi
yang akan dijadikans ebagai kriteria penyaringan.
Dalam perintah SELECT ditambah klausa WHERE setelahnya. */

-- Contoh 1
-- Menampilkan data buku yang harganya kurang dari Rp. 45.000
SELECT
	buku_isbn as 'ISBN',
	buku_judul as 'JUDUL BUKU',
	buku_harga as 'HARGA'
FROM
	buku
WHERE
	buku_harga < 45000;


-- Menampilkan data buku yang harganya kurang dari Rp. 45.000
-- dan ISBN diawali oleh angka 777
SELECT
	buku_isbn as 'ISBN',
	buku_judul as 'JUDUL BUKU',
	buku_harga as 'HARGA'
FROM
	buku
WHERE
	(buku_harga < 45000) AND
	(buku_isbn LIKE '777%');


-- Menampilkan data dengan rentang tertentu
-- Menggunakan klausa BETWEEN

-- Contoh BETWEEN 1
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	buku_harga BETWEEN 50000 AND 60000;

-- Contoh BETWEEN 2
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	(buku_harga >= 50000) AND
	(buku_harga <= 60000);


/* Klausa LIMIT
-----------------
LIMIT digunakan untuk membatasi data yang disajikan
sesuai batas limit yang ditentukan terurut dari atas. */

-- Contoh LIMIT
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
LIMIT 5;

-- LIMIT juga bisa membatasi data yang dimulai dari baris tertentu
-- Membatasi 10 data dimulai dari urutan ke-6
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
LIMIT 5,10;


/* Klausa DISTINCT
Klausa ini berfungsi untuk menghilangkan data yang dobel saat disajikan */

-- Contoh sebelum diberi DISTINCT
SELECT penerbit_id FROM buku;

-- Setelah diberi klausa DISTINCT
SELECT DISTINCT penerbit_id FROM buku;


/* Mengurutkan Data
----------------------
Secara default data yang disajikan menggunakan printah SELECT
akan ditmpilkan sesuai urutan data dimasukkan,
kecuali pada kolom yang diatur sebagai primary key,
maka dia akan urut sesui bilangan.
Untuk mengurutkan data sesuai kolom tertentu
kita bisa menggunakan klausa ORDER BY. */


-- Contoh Penggunaan ORDER BY
-- Mengurutkan datan sesuai kolom 'buku_judul'
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
ORDER BY
	buku_judul;


-- Pengurutan data dari terkecil ke terbesar (Ascending)
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
ORDER BY
	buku_judul ASC;


-- Pengurutan data dari terbesar ke terkecil (Descending)
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
ORDER BY
	buku_judul DESC;


/* ===================================== */
/*                  BAB 7                */
/* ------------------------------------- */
/* 			Seleksi Data - Bagian 2 	 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */



-- Pengelompokan Data menggunakan GROUP BY
------------------------------------------
-- Penggunaan kalusa GROUP BY disertakan dalam perintah SELECT


-- Contoh 1
------------------------
SELECT
	penerbit_id,
	COUNT(*)
FROM
	buku
GROUP BY
	penerbit_id;
------------------------
/*
Keterangan Kode
------------------------
Jumlah buku yang ditampilkan dari hasil kode di atas adalah
hasil dari proses pengelompokan brdasarkan penerbit
(dalam hal ini kolom penerbit_id).
*/


-- Contoh 2
------------------------
SELECT
	a.penerbit_id as 'Kode Penerbit',
	b.penerbit_nama as 'Nama Penerbit',
	COUNT(a.penerbit_id) as 'Jumlah Buku'
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id
GROUP BY
	a.penerbit_id,
	b.penerbit_nama;
-------------------------
/*
Keterangan Kode
-------------------------
Pada kode di atas ditambahkan kolom penerbit_nama agar lebih jelas.
*/


-- Contoh 3
--------------------------
SELECT
	a.pengarang_id as 'ID Pengarang',
	a.pengarang_nama as 'Nama Pengarang',
	GROUP_CONCAT(b.buku_judul) as 'Daftar Judul Buku'
FROM
	pengarang a,
	buku b,
	link_buku_pengarang c
WHERE
	a.pengarang_id = c.pengarang_id AND
	b.buku_isbn = c.buku_isbn
GROUP BY
	a.pengarang_id,
	a.pengarang_nama;
/*
Keterangan Kode
------------------------
Kode terebut akan menampilkan daftar judul buku yagn dikelompokkan berdasarkan pengarang.

GROUP CONCAT() adalah fungsi agregasi yagn berguna untuk mengelompokkan baris data
menjadi satu teks (string) tunggal.
*/


/*
------------------------
-- MENGGABUNGKAN DATA
------------------------
Proses menggabungkan 2 query select menjadi 1 dengan perintah UNION
dengan syarat masing-masing query select menghasilkan jumlah row data yang sama.
*/

-- Query 1
----------------------
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	buku_harga <= 40000;
----------------------
-- Kode di atas akan menghasilkan 6 row data


-- Query 2
----------------------
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE buku_harga >= 50000;
----------------------
-- Kode tersebut menghasilkan 10 row data


-- Query 3 : Penggabungan Query menggunakan UNION
-----------------------------
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	buku_harga <= 40000
UNION
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE buku_harga >= 50000;
-----------------------------


/*
--------------------------------------------
JOIN : SELEKSI DATA DARI 2 TABEL ATAU LEBIH
--------------------------------------------
Seleksi data dari 2 tabel atau lebih, lebih rumit
dibandingkan seleksi data dari 1 tabel.
Syarat utamanya adalah adanya kolom relasi.
Kolom relasi adalah kolom yang digunakan
sebagai kunci untuk menghubungkan antara tabel
yang satu dengan tabel yang lain.
*/


-- Contoh 1 :
-- Seleksi data dari 2 tabel (sederhana)
-------------------------------------
SELECT
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id;
-------------------------------------
/*
Keterangan Kode
Tampilkan data dari kolom buku_isbn dan buku_judul pada tabel buku
dengan nama alias a, serta kolom penerbit nama pada tabel penerbit
dengan nama alias b yang nilai penerbit_id nya sama.
*/


-- Contoh 2
-- Seleksi data yang melibatkan 4 tabel
-----------------------------------------
SELECT
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama,
	GROUP_CONCAT(d.pengarang_nama)
FROM
	buku a,
	penerbit b,
	link_buku_pengarang c,
	pengarang d
WHERE
	a.penerbit_id = b.penerbit_id AND
	a.buku_isbn = c.buku_isbn AND
	c.pengarang_id = d.pengarang_id
GROUP BY
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama;
-----------------------------------------


-- Contoh 3
-- Seleksi data Tambahan
-----------------------------------------
SELECT
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama,
	GROUP_CONCAT(d.kategori_nama)
FROM
	buku a,
	penerbit b,
	link_buku_kategori c,
	kategori d
WHERE
	a.penerbit_id = b.penerbit_id AND
	a.buku_isbn = c.buku_isbn AND
	c.kategori_id = d.kategori_id
GROUP BY
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama;
-----------------------------------------


/*
----------------------------------------
PENGURANGAN DAN INTERSEKSI DATA
----------------------------------------

*/


/*
----------------------------------------
SUBQUERY
----------------------------------------

*/


To be Continued
-- View : Tabel Virtual
-- Manajemen User
-- Fungsi Agregasi
-- Operator dan Fungsi
-- Mendefinisikan Prosedur dan Fungsi
-- Trigger
-- Ekspor dan Impor Data
-- MySQL dan Python
-- MySQL dan PHP
-- Membuat Aplikasi Web dengan MySQL dan PHP