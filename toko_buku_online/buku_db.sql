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
Hal ini dilakukan untuk menyeleksi sekelompok data dari satu tabel
lalu dikurangi dengan sekelompok data dari tabel lain
*/

-- Contoh 1 : Menggunakan INNER JOIN
---------------------------------------
-- 1. Masukkan data dulu ke tabel penerbit
----------------------------------------
INSERT INTO penerbit
VALUES ('PB09', 'MODULA');
----------------------------------------

-- 2. Lihat data penerbit_id pada tabel penerbit
----------------------------------------
SELECT
	a.penerbit_id
FROM
	penerbit a;
----------------------------------------

-- 3. Lihat data penerbit_id pada tabel buku ditambah klausa DISTINCT
----------------------------------------
SELECT DISTINCT
	b.penerbit_id
FROM
	buku b;
----------------------------------------

-- 4. Lakukan interseksi data dengan query berikut
----------------------------------------
SELECT DISTINCT
	a.penerbit_id
FROM
	penerbit a
INNER JOIN
	buku b
USING
	(penerbit_id);
----------------------------------------
-- Hasil yang muncul merupakan irisan dari data query pertama
-- dan query ke dua.


-- Contoh 2 : Menggunakan MINUS / NOT IN
---------------------------------------
-- 1. Lihat data penerbit_id pada tabel penerbit
----------------------------------------
SELECT
	a.penerbit_id
FROM
	penerbit a;
----------------------------------------

-- 2. Lihat data penerbit_id dari tabel buku, gunakan  klausa DISTINCT
----------------------------------------
SELECT DISTINCT
	b.penerbit_id
FROM
	buku b;
----------------------------------------

-- 3. Lakukan pengurangan data query 1 dengan query 2
----------------------------------------
SELECT DISTINCT
	a.penerbit_id
FROM
	penerbit a
WHERE
	(a.penerbit_id) NOT IN
	(SELECT b.penerbit_id FROM buku b);
---------------------------------------
-- Hasilnya adalah data penerbit_id pada tabel penerbit
-- yang tidak ada pada data penerbit_id tabel buku.



/*
----------------------------------------
SUBQUERY
----------------------------------------
Subquery adalah perintah SELECT yang terdapat dalam perintah SELECT lain.
Hal ini memudahkan kita untuk membuat berbagai format laporan
semisal crosstab query.
*/

-- Contoh 1
-- Membuat query yang dapat menampilkan jumlah buku
-- yang diterbitkan oleh masing-masing penerbit.
-- kita akan menggunakan tabel buku dan tabel penerbit.
----------------------------------------
SELECT
	a.penerbit_id,
	a.penerbit_nama,
	(SELECT
		COUNT(*)
	FROM
		buku
	WHERE
		penerbit_id = a.penerbit_id)
	as 'Jumlah Buku'
FROM
	penerbit a;
----------------------------------------
/*
Pada contoh tersebut perintah SELECT bagian luar digunakan untuk
menyeleksi data dari tabel penerbit, sedangkan bagian dalam
digunakan untuk menyeleksi data dari tabel buku.

Subquery juga biasa digunakan sebagai kolom penentu kondisi query
(di bagian WHERE)
*/

-- Contoh 2 : Subquery sebagai penentu bagian WHERE
----------------------------------------
SELECT
	penerbit_id,
	penerbit_nama
FROM
	penerbit
WHERE
	penerbit_id NOT IN
	(SELECT
		penerbit_id
	FROM
		buku);
----------------------------------------
/*
Perintah di atas digunakan untuk menampilkan data pada tabel 'penerbit'
(kolom 'penerbit_id' dan 'penerbit_nama') yang datanya
tidak terdapat pada tabel buku.
*/


/* ===================================== */
/*                  BAB 8                */
/* ------------------------------------- */
/* 			VIEW : Tabel Virtual 		 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */

/*
Pendahuluan
------------
View adalah objek di dalam database yang berisi kumpulan kolom
yang dihasilkan dari perintah SELECT.

Secara sederhana, View adalah objek yang menyimpan hasil query,
baik dari satu tabel atau lebih.

View juga sering disebut sebagai 'Tabel Virtual',
karena view sebenarnya tidak memiliki data.

Data yang ditampilkan oleh view diambil dari tabel-tabel aktual
yang disertakan dalam perintah SELECT.

Mengapa perlu menggukan View?
-----------------------------
1. Akses data menjadi lebih mudah
	- View dapat digunakan untuk menampilkan rangkuman dari suatu perhitungan tertentu.
	- View dapat menampilkan beberapa kolom atau beberapa baris saja dari suatu tabel,
		tergantung kondisi yagn didefinisikan.
	- View dapat digunakan untuk menampilkan data yang berasal dari dua tabel atau lebih.

2. View dapat digunakan untuk menampilkan data yang berbeda
untuk masing-masing user, sehingga setiap user hanya dapat melihat data
sesuai dengan hak aksesnya.

* Pada kasus-kasus tertentu, VIEW dapat dimodifikasi dengan perintah INSERT, UPDATE dan DELETE.
* Jika suatu data pada VIEW berubah, maka yang sebenarnya berubah
  adalah data pada base table.
*/

-- 1. Membuat VIEW
---------------------------
CREATE VIEW v_buku AS
SELECT
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama,
	a.buku_tglterbit,
	a.buku_jmlhalaman,
	a.buku_harga
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id
ORDER BY
	a.buku_judul;
---------------------------


-- 2. Menampilkan VIEW
---------------------------
SELECT * FROM v_buku;
---------------------------


-- 3. Melihat daftar kolom pada View
-------------------------------------
DESC v_buku;
-------------------------------------


-- 4. Mengubah VIEW
-------------------------------------
ALTER VIEW v_buku AS
SELECT
	a.buku_isbn,
	a.buku_judul,
	b.penerbit_nama,
	a.buku_harga
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id
ORDER BY
	a.buku_judul;
-------------------------------------
-- Test Perubahan VIEW
SELECT * FROM v_buku;
-------------------------------------


-- 5. Menghapus VIEW
-------------------------------------
-- Format 1
DROP VIEW IF EXISTS v_buku;

-- Format 2
DROP VIEW v_buku;
-------------------------------------


-- 6. Membuat VIEWyang dapat dimodifikasi
/*
Suatu View dapat dimodifikasi jka kolom-kolom dalam view tersebut
mengacu langsung ke kolom yang terdapat pada base table,
bukan hasil proses perhitungan.
*/

-- Contoh 1
-- View yang tidak dapat dimodifikasi
-------------------------------------
CREATE VIEW v_jmlBukuPerPenerbit AS
SELECT
	b.penerbit_nama AS 'Nama Penerbit',
	COUNT(a.buku_judul) AS 'Jumlah Buku'
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id
GROUP BY
	b.penerbit_nama
ORDER BY
	b.penerbit_nama;
-------------------------------------
-- Menampilkan View

SELECT * FROM v_jmlBukuPerPenerbit;
-------------------------------------
/*
View di atas tidak dapat dimodifikasi
karena data yang ditampilkan
merupakan hasil dari proses perhitungan
(dari fungsi agregasi COUNT()).
*/
-------------------------------------


-- Contoh 2
-- View yang dapat dimodifikasi
-------------------------------------
CREATE VIEW v_jmlHalaman AS
SELECT
	buku_isbn,
	buku_judul,
	buku_jmlhalaman
FROM
	buku
ORDER BY
	buku_isbn;
-------------------------------------
-- Menampilkan View

SELECT * FROM v_jmlHalaman;
-------------------------------------
-- Modifikasi View

UPDATE v_jmlHalaman
SET
	buku_jmlhalaman = buku_jmlhalaman + 10
WHERE
	buku_isbn = '999-11555-2-1';
-------------------------------------
-- Mencoba View dengan data tertentu

SELECT * FROM v_jmlHalaman
WHERE
	buku_isbn = '999-11555-2-1';
-------------------------------------
/*
Jika query tersebut dijalankan maka data jumlah halaman yang awalnya berjumlah 270
akan berubah menjadi 280, dan perubahan tersebut tersimpan dalam database.

Hal ini dikarenakan kita telah melakukan update pada View.

Catatan : saat kita mengubah data pada suatu view, maka yang berubah adalah
data pada base tabel, karena view tidak memiliki data.
Inilah yang membuat View dinamakan sebagai 'Tabel Virtual'.
*/
-- Sebagai pembuktian
-- Kita cooba mengakses data tersebut tanpa View

SELECT
	buku_isbn,
	buku_judul,
	buku_jmlhalaman
FROM
	buku
WHERE
	buku_isbn = '999-11555-2-1';

-- Hasil yang ditampilkan sama dengan view 'v_jmlHalaman'
-------------------------------------

-- 7. Batasan-batasan Penggunaan VIEW
-------------------------------------
/*
1. Pendefinisian VIEW dapat menambahkan klausa yang terdapat pada perintah SELECT
	seperti WHERE, GROUP BY, ORDER BY, dll.

2. Tidak bisa membuat view temporary.

3. Tidak dapat mengasosiasikan trigger dengan VIEW

4. Tabel-tabel yang diakses menggunakan view harus ada di dalam database,
	Jika nama tabel dirubah,maka view tidak dapat digunakan lagi
	(terjadi kesalahan saat eksekusi).

5. Perintah SELECT yang didefinisikan di dalam VIEW tidak boleh
	berisi konstruksi-konstruksi berikut:
	- Subquery di dalam klausa FROM
	- Mengacu kepada tabel temporary
*/


/* ===================================== */
/*                  BAB 9                */
/* ------------------------------------- */
/* 				Manajemen User	 		 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */

/*
Pendahuluan
------------
User adalah orang yang dapat menggunakan database.
Sejauh mana user dapat bekerja di dalam database ditentukan oleh
hak akses yang dimilikinya.
Apakah sebagai Database Administrator atau operator.
*/

-- 1. Membuat User
------------------------------------------
CREATE USER admin IDENTIFIED BY 's3cr3t';
------------------------------------------
-- Pada query di atas kita hanya membuat user dengan diberi password 's3cr3t'.
-- Maka kita sudah bisa login menggunakan user 'admin',
-- namun belum bisa mengakses seluruh database, kecuali 'information_schema'.

-- 2. Login user baru
------------------------------------------
mysql -u admin -p
------------------------------------------
-- Tekan ENTER dan masukkan password 's3cr3t' lalu ENTER.
-- Coba tampilkan database dengan query  berikut
------------------------------------------
SHOW DATABASES;
------------------------------------------
-- Database yang tampil hanya 'information_schema'

-- Coba untuk mengaktifkan database 'buku_db'
------------------------------------------
USE buku_db;
------------------------------------------
-- Yang terjadi adalah error  : Access Denied,
-- Karena user admin belum diberi hak akses terhada database 'buku_db'

-- 3. Mengenal Hak Akses
------------------------------------------
/*
Hak akses dibagi menjadi 2, yaitu:
- Level User
- Level Administrator

Hak akses level user meliputi:
1. CREATE
2. CREATE TEMPORARY TABLES
3. CREATE VIEW
4. DELETE
5. EXECUTE
6. INDEX
7. INSERT
8. LOCK TABLES
9. SELECT
10. SHOW DATABASES
11. SHOW VIEW
12. UPDATE
13. USAGE

Hak akses level administrator meliputi:
1. ALL
2. ALTER
3. CREATE USER
4. DROP
5. FILE
6. PROCESS
7. RELOAD
8. SHUTDOWN
*/


-- 4. Memberi Hak Akses
------------------------------------------

-- Versi 1
------------------------------------------
GRANT ALL
ON buku_db.*
TO 'admin'@'%'
IDENTIFIED BY 's3cr3t';
------------------------------------------
-- Query di atas digunakan untuk memberikan seluruh hak akses kepada 'admin'


-- Versi 2
------------------------------------------
GRANT USAGE, INSERT, UPDATE, DELETE, SELECT
ON pengarang
TO 'admin'@'%'
IDENTIFIED BY 's3cr3t';
------------------------------------------
-- Query di atas digunakan untuk memberi hak akses user
-- dengan beberapa hak akses tertentu
-- untuk pemiisah hak akses menggunakan tanda koma ','


-- 5. Mencabut Hak Akses
------------------------------------------

-- Versi 1
------------------------------------------
REVOKE ALL ON buku_db.* FROM admin;
------------------------------------------
-- Mencabut seluruh hak akses pada seluruh tabel dalam database 'buku_db'


-- Versi 2
------------------------------------------
REVOKE USAGE, INSERT, UPDATE, DELETE, SELECT
ON pengarang
FROM admin;
------------------------------------------
-- Mencabut beberapa hak akses user yang ditentukan sebelumnya.


-- 6. Menghapus User
------------------------------------------
DROP USER 'admin'@'%';
------------------------------------------


-- 7. Mengetahui Hak Akses User
------------------------------------------
/*
Ketika kita melakukan perintah GRANT dan REVOKE, maka MySQL akan menyimpan
informasi hak akses ke dalam database 'mysql'.

Dengan demikian, sebenarnya kita bisa memberi dan mencabut hak akses
seorang user dengan mengedit isi dari database tersebut.

Akan tetapi jika kita mengedit data pada database mysql,
kita perlu melakukan query berikut:
---------------------------
FLUSH PRIVILEGES;
---------------------------
Query tersebut berguna untuk memuat ulang (refresh) perubahan
yang telah dilakukan ke dalam database mysql.
*/

-- Melihat daftar kolomdari tabel tertentu (misalnya tabel user)
------------------------------------------
DESC user;
------------------------------------------

-- Melihat daftar user yagn ada di server MySQL
-----------------------------------------
SELECT user, host FROM user;
-----------------------------------------


-- 	============================
		To be Continued
-- 	============================
-- Fungsi Agregasi
-- Operator dan Fungsi
-- Mendefinisikan Prosedur dan Fungsi
-- Trigger
-- Ekspor dan Impor Data
-- MySQL dan Python
-- MySQL dan PHP
-- Membuat Aplikasi Web dengan MySQL dan PHP