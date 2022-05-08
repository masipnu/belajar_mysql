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


/* ===================================== */
/*                  BAB 10               */
/* ------------------------------------- */
/* 				Fungsi Agregasi	 		 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */

/*
Pendahuluan
---------------
Fungsi Agregasi adalah fungsi di dalam SQL yang digunakan
untuk melakukan perhitungan pada query.

Pada umumnya, penggunaannya dikombinasikan dengan klausa
GROUP BY untuk menghasilkan rangkuman nilai yang
dikelompokkan berdasarkan kolom tertentu.

Yang termasuk fungsi agregasi ada 6, yaitu:
1. MIN()
2. MAX()
3. SUM()
4. COUNT()
5. AVG()
6. GROUP_CONCAT()
*/

/*
1. Fungsi MIN()
-------------------
Berfungsi untuk mengembalikan nilai minimal dari suatu kolom
pada tabel tertentu.

Contohnya untuk mengetahui jumlah halaman paling sedikit
dari daftar buku yang terdapat pada tabel 'buku'
*/
-- Contoh Kode MIN() pada kolom bertipe angka
-------------------------
SELECT
	MIN(buku_jmlhalaman)
FROM
	buku;
-------------------------
/*
Query MIN() di atas diterapkan pada kolom yang bertipe numerik.
Jika query MIN() diterapkan pada kolom bertipe teks,
maka akan mengembalikan nilai terkecil dari teks yang ada
berdasarkan urutan abjad.
*/

-- Contoh query MIN() pada kolom bertipe teks
-------------------------
SELECT
	MIN(buku_judul)
FROM
	buku;
-------------------------

/*
2. Fungsi MAX()
-------------------------
Fungsi MAX() adalah fungsi kebalikan dari fungsi MIN(),
yang berguna untuk memperoleh nilai maksimal dari suatu kolom
yang terdapat dalam tabel tertentu.

Fungsi MAX() dapat diaplikasikan pada kolom bertipe angka
dan teks.
*/

-- Contoh Kode MAX() pada kolom bertipe angka
--------------------------
SELECT
	MAX(buku_jmlhalaman)
FROM
	buku;
--------------------------


-- Contoh Kode MAX() pada kolom bertipe teks
--------------------------
SELECT
	MAX(buku_judul)
FROM
	buku;
--------------------------

/*
3. Fungsi SUM()
--------------------------
Fungsi SUM() berfungsi untuk menjumlahkan nilai
dari suatu kolom dalam tabel tertentu.

Sebagai contoh, untuk menghitung jumlah total dari
kolom 'buku_jmlhalaman' pada tabel 'buku'.
*/

-- Contoh query SUM()
--------------------------
SELECT
	SUM(buku_jmlhalaman)
FROM
	buku;
--------------------------
/*
Nilai yang tampil dari hasil query tersebut merupakan
jumlah total dari semua perintah yang tersimpan dalam
kolom 'buku_jmlhalaman' pada tabel 'buku'.
*/


/*
4. Fungsi COUNT()
-------------------------
Fungsi COUNT() berfungsi untuk memperoleh banyaknya baris
yang dihasilkan oleh suatu query.
*/

-- Contoh query COUNT()
------------------------
SELECT
	COUNT(*)
FROM
	buku
WHERE
	penerbit_id = 'PB06';
------------------------

/*
Sebagai pembuktian, kita bisa mengecek data
secara manual dengan query berikut
*/
------------------------
SELECT
	buku_isbn,
	buku_judul
FROM
	buku
WHERE
	penerbit_id = 'PB06';
------------------------
/*
Hasil dari query di atas menunjukkan bahwa terdapat
5 baris data di dalam tabel buku dengan 'penerbit_id'
bernilai 'PB06'.
*/


/*
5. Fungsi AVG()
--------------------------------
Fungsi AVG() berguna untuk menghitung nilai rata-rata
dari suatu kolom yang dihasilkan oleh query tertentu

Sebagai contoh, untuk menghitung nilai rata-rata
dari jumlah halaman buku yang berasal dari penerbit
dengan kode 'PB06'.
--------------------------------
*/

-- Contoh query AVG()
--------------------------------
SELECT
	AVG(buku_jmlhalaman)
FROM
	buku
WHERE
	penerbit_id = 'PB06';
--------------------------------

/*
Sebagi pembuktian, gunakan query berikut
dan hitung secara manual
*/

--------------------------------
SELECT
	buku_isbn,
	buku_judul,
	penerbit_id,
	buku_jmlhalaman
FROM
	buku
WHERE
	penerbit_id = 'PB06';
--------------------------------
/*
Perhitungannya adalah
(450 + 490 + 346 + 400 + 300) / 5
hasilnya = 397,2
*/


/*
6. GROUP_CONCAT
--------------------------------
Fungsi GROUP_CONCAT() adalah untuk menyambung
beberapap baris data dari suatu kolom
menjadi sebuah teks tunggal.
*/


-- Query sebelum menggunakan GROUP_CONCAT()
--------------------------------
SELECT
	penerbit_nama
FROM
	penerbit;
--------------------------------
-- Data ditampilkan menjadi beberapa baris


-- Query menggunakan GROUP_CONCAT()
--------------------------------
SELECT
	GROUP_CONCAT(penerbit_nama)
FROM
	penerbit;
--------------------------------
-- Data ditampilkan menjadi satu baris data


/*
Dalam studi kasus database buku, fungsi GROUP_CONCAT()
bisa diterapkan untuk mengelompokkan judul buku
berdasarkan penerbit, menggunakan query berikut.
*/

--------------------------------
SELECT
	b.penerbit_nama,
	GROUP_CONCAT(a.buku_judul)
FROM
	buku a,
	penerbit b
WHERE
	a.penerbit_id = b.penerbit_id
GROUP BY
	b.penerbit_nama
ORDER BY
	b.penerbit_nama;
--------------------------------
/*
Hasil dari query tersebut akan tampak daftar judul buku
yang ditampilkan dalam sebuah teks tunggal
yang dikelompokkan berdasarkan nama penerbit.

Fungsi GROUP_CONCAT() bisa dikustomisasi dengan beberapa
klausa berikut : 
1. SEPARATOR
2. ORDER BY
3. DISTINCT
*/

/*
1. SEPARATOR
-------------
Secara default, pemisah yang digunakan dalam
fungsi GROUP_CONCAT() adalah tanda koma (,),
namun kita bisa kustomisasi dengan klausa SEPARATOR.
*/
--------------------------------
SELECT
	GROUP_CONCAT(penerbit_nama SEPARATOR ' - ' )
FROM
	penerbit;
--------------------------------


/*
2. ORDER BY
--------------
Digunakan untuk mengurutkan nilai yang akan digabung
dengan fungsi GROUP_CONCAT().
*/
--------------------------------
SELECT
	GROUP_CONCAT(penerbit_nama ORDER BY penerbit_nama)
FROM
	penerbit;
--------------------------------


/*
3. DISTINCT
-------------
Klausa DISTINCT bisa digunakan untuk menghilangkan
duplikasi data yang akan digabung dengan GROUP_CONCAT().
*/
--------------------------------
SELECT
	GROUP_CONCAT(DISTINCT penerbit_nama)
FROM
	penerbit;
--------------------------------

/*
Catatan:
- Jika ketiga klausa tersebut digabung dalam fungsi GROUP_CONCAT()
maka harus diurutkan yaitu DISTINCT, ORDER BY, SEPARATOR.
Jika tidak, maka akan error.
*/

-- Contoh :
--------------------------------
SELECT
	GROUP_CONCAT(
		DISTINCT penerbit_nama
		ORDER BY penerbit_nama
		SEPARATOR ', ')
FROM
	penerbit;
--------------------------------

/*
Catatan:
Fungsi GROUP_CONCAT() akan mengabaikan nilai NULL.
*/


/*
Penggunaan Agregasi untuk nilai NULL
------------------------------------
Secara umum fungsi-fungsi agregasi akan mengabaikan
nilai NULL, kecuali COUNT().

Fungsi COUNT() memiliki sifat-sifat berikut:
1. COUNT(*) tidak akan mengabaikan nilai NULL
2. COUNT(ekspresi) dan COUNT(DISTINCT)
	akan mengabaikan nilai NULL

Untuk menguji kedua sifat di atas,
kita bisa melakukan pengujian sebagai berikut.
*/

-- 1. Membuat tabel
--------------------------------
CREATE TABLE tnull(
	a int
);
--------------------------------

-- 2. Menambahkan data
--------------------------------
INSERT INTO tnull VALUES
(NULL),
(NULL),
(NULL),
(NULL),
(NULL);
--------------------------------

-- Pembuktian sifat pertama
--------------------------------
SELECT
	COUNT(*)
FROM
	tnull;
--------------------------------
/*
Hasil query tersebut akan memberikan hasil 5,
karena NULL juga ikut dihitung sebagai satu baris data.
*/

-- Pembuktian sifat ke dua
--------------------------------
SELECT
	COUNT(a)
FROM
	tnull;
--------------------------------
SELECT
	COUNT(DISTINCT a)
FROM
	tnull;
--------------------------------
/*
Hasil query di atas, akan memberikan nilai 1,
karena nilai NULL tidak dihitung sebagai
satu baris data, dengan kata lain nilai NULL
akan diabaikan.(pernyataan di buku)

Terjadi perbedaan, ketika saya coba sendiri,
hasil dari query  2 dan 3, mengembalikan hasil 0.
*/

-- Percobaan seluruh fungsi agregasi terhadap nilai NULL
SELECT MIN(a) FROM tnull;
SELECT MAX(a) FROM tnull;
SELECT SUM(a) FROM tnull;
SELECT COUNT(a) FROM tnull;
SELECT AVG(A) FROM tnull;
SELECT GROUP_CONCAT(a) FROM tnull;
/*
Semua akan mengembalikan nilai NULL, kecuali COUNT().
*/


/* ===================================== */
/*                  BAB 11                */
/* ------------------------------------- */
/* 			Fungsi dan Operator	 		 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */


/*
MySQL menyediakan banyaj operator dan fungsi built-in yang dapat bermanfaat
dalam pembuatan query.

Fungsi built-in adalah fungsi siap pakai yang sudah didefinisikan oleh MySQL
untuk menunjang kemudahan bagi para penggunanya.

Pada umumnya operator dan fungsi digunakan pada perintah SELECT
dan kalusa WHERE.
*/


/*
1. Operator
----------------------
Operator merupakan simbol-simbol khusus yang diguankan untuk melakukan
opersi-operasi tertentu, seperti perhitungan, perbandingan dua nilai, dan lain-lain.

Operator dikategorikan menjadi 3 kelompok, yaitu:
1. Operator Aritmatika
2. Operator Relasional
3. Operator Logika
*/


/*
a. Operator Aritmatika
----------------------
Digunakan untuk melakukan perhitungan di dalam query maupun prosedur/ fungsi.
+	: Untuk melakukan operasi penjumlahan
-	: Untuk melakukan operasi pengurangan
*	: Untuk melakukan operasi perkalian
/	: Untuk melakukan operasi pembagian
*/

-- Contoh Operasi Aritmatika
-----------------------------
SELECT
	buku_judul as 'Judul',
	buku_harga as 'Harga Normal',
	buku_harga - (0.25 * buku_harga) as 'Harga Diskon (25%)'
FROM
	buku
WHERE
	buku_isbn IN ('222-34222-1-0', '222-34222-1-1');
-----------------------------
/*
Query di atas digunakan untuk menampilkan daftar buku
dan harga normal serta harga setelah mendapatkan diskon
sebesar 25%.

Operasi di atas melibatkan operasi perkalian dan pengurangan.
*/


/*
b. Operator Relasional
----------------------
Digunakan untuk mebandingkan dua nilai atau ekspresi.

Yang termasuk ke dalam operator relasional adalah:
=						: Sama dengan
!= atau <>				: Tidak sama dengan
<						: Lebih kecil
<=						: Lebih kecil atau sama dengan
>						: Lebih besar
>=						: Lebih besar atau sama dengan
n BETWEEN min AND max	: Memeriksa, apakah n berada di dalam rentang min dan max atau tidak
n IN (ser)				: Memeriksa keanggotaan himpunan (set),
						  apakah n anggota dari himpunan yang didefinisikan atau tidak
n IS NULL 				: Memeriksa nilai n dengan nilai NULL
ISNULL					: Fungsi untuk memeriksa nilai n, NULL atau tidak
*/

-- Contoh penggunaan operator relasional
----------------------------------------
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	buku_harga <= 50000;
----------------------------------------
/*
Query di atas digunakan untuk menampilkan daftar buku yang harganya
lebih kecil atau sama dengan Rp. 50.000
*/


/*
c. Operator Logika
----------------------
Berfungsi untuk mengecek nilai kebenaran: benar (true) dan salah (false).

Berikut daftar operator logika dalam MySQL:
AND atau &&	: Operasi logika AND (dan)
OR atau ||	: Operasi logika OR (atau)
NOT atau !	: Operasi logika negasi (bukan/ tidak)
XOR			: Operasi EXCLUSIVE OR

Hal-hal yang perlu diperhatikan dalam penggunaan operator logika adalah:

1. Dalam operasi AND,
	nilai true hanya diperoleh jika kedua ekspresi atau operandd bernilai true.
	selain koondisi tersebut, nilai yang dihasilkan adalah false.

2. Dalam operasi OR,
	nilai false hanya diperoleh jika kedua ekspresi atau operand bernilai false.
	Selain kondisi tersebut, nilai yang dihasilkan adalah true.

3. Dalam operasi XOR,
	nilai true hanya diperoleh jika salah satu (bukan keduannya) ekspresi
	atau operand bernilai true.
*/

-- Contoh penggunaan operator logika
------------------------------------
SELECT
	buku_isbn,
	buku_judul,
	buku_harga
FROM
	buku
WHERE
	buku_harga <= 50000 AND
	penerbit_id = 'PB06';
------------------------------------
/*
Query tersebut digunakan untuk menampilkan data buku yang harganya di bawah
atau sama dengan 50.000 dan memiliki kode penerbit 'PB06'.
*/


/*
2. Fungsi-fungsi untuk teks
----------------------
Adalah fungsi-fungsi yang digunakan untuk emlakukan manipulasi pada teks,
baik di dalam query maupun prosedur/ fungsi.

Selain itu terdapat juga fungsi yang berguna utnuk membandingkan dua teks,
apakah sama atau tidak.

Berikut daftar fungsi built-in MySQL untuk teks yang sering digunakan.

	concat(s1, s2, ...)			: Menyambung teks s1 dengan s2 dan seterusnya

	length(s)					: Mengembalikan lebar (jumlah karakter)

	locate(s2, s2, n)			: Mencari teks s1 dalam s2 yang dimulai dari posisi ke-n
								  Nilai kembalian adalah posisi awal teks s1

	lower()						: Mengubah semua karakter teks s menjadi huruf kecil

	upper()						: Mengubah semua karakter teks s menjadi huruf besar

	quote(s)					: Mengapit teks dengan tanda petik tunggal

	replace(s, slama, sbaru)	: Mengganti teks slama di dalam teks s dengan teks sbaru

	substring(s, posisi, lebar)	: Mengambil bagian teks dari s dimulai dari
								  posisi sebanyak lebar karakter

	trim(s)						: Membuang whitespace (karakter kosong) yang terdapat
								  di bagian awal dan akhir teks

	ltrim(s)					: Membuang whitespace (karakter kosong) yang terdapat
								  di bagian awal (kiri) teks s

	rtrim(s)					: Membuang whitespace (karakter kosong) yang terdapat
								  di bagian akhir (kanan) teks s
*/


/*
a. Fungsi concat()
---------------------
Berfungsi untuk menyambung dua teks atau lebih tergantung pada banyaknya parameter
yang dilewatkan pada saat pemanggilan fungsi.
*/
-----------------------------------------
SELECT CONCAT('Belajar', ' ', 'MySQL');
-----------------------------------------
/*
Query concat() di atas berguna untuk menyambung tiga teks sekaligus, yaitu : 'Belajar',
karakter spasi dan 'MySQL'. hasilnya adalah teks 'Belajar MySQL'
*/


/*
b. Fungsi length()
---------------------
Berfungsi untuk mengetahui panjang karakter yang menyusun sebuah teks.
*/
-----------------------------------------
SELECT LENGTH('MySQL')
-----------------------------------------
/*
Query di atas akan menampilkan nilai 5, yang merupakan
jumlah karakter penyusun teks 'MySQL'
*/


/*
c. Fungsi locate()
---------------------
Berfungsi untuk mencari suatu karakter atau bagian teks (substring)
*/
-----------------------------------------
SELECT LOCATE('base', 'Pemrograman Database', 1);
-----------------------------------------
/*
Query di atas akan mencari substring 'base' di dalam teks 'Pemrograman Database'.
Pencarian dilakukan mulai posisi karakter ke-1.

Hasil yang diperoleh adalah 17. Hal ini menunjukkan bahwa substring 'base'
ditemukan pada posisi karakter ke-17.

Jika substring yang dicari tidak ditemukan,
maka fungsi locate akan mengembalikan nilai 0.
*/


/*
d. Fungsi lower() dan upper()
------------------------------
Klausa lower() berfungsi untuk mengembalikan karakter teks menjadi huruf kecil semua,
sedangkan klausa upper() berfungsi untuk mengembalikan karakter teks menjadi
huruf besar semua.
*/
-----------------------------------------
SELECT LOWER('Pemrograman Database')

SELECT UPPER('Pemrograman Database')
-----------------------------------------


/*
e. Fungsi quote()
---------------------
Berfungsi untuk mengapit suatu teks menggunakan tanda petik tunggal.

Sebagai contoh, jika kita ingin membuat teks dengan proses INSERT dalam
suatu prosedur/ fungsi yagn didefinisikan sendiri.
*/
-- Contoh 1
-----------------------------------------
SET @STR = 'MySQL';
SELECT @STR
-----------------------------------------
-- Query di atas akan mengembalikan teks berupa string MySQL (tanpa tanda kutip)

-- Contoh 2
-----------------------------------------
SET @STR = qoute('MySQL');
SELECT @STR;
-----------------------------------------
-- Query di atas akan mengembalikan teks berupa string 'MySQL' (dengan tanda kutip)


/*
f.  Fungsi replace()
----------------------
Berfungsi untuk mengganti suatu karakter atau bagian teks tertentu.
*/
-----------------------------------------
SELECT
	REPLACE('Pemrograman Database',
			'Database',
			'MySQL');
-----------------------------------------
/*
Query di atas akan mengganti substring 'Database' dengan string 'MySQL'.
*/


/*
g. Fungsi substring()
---------------------
Digunakan untuk mengambil karakter atau bagian teks
(dengan jumlah karakter tertentu) dari suatu teks.
*/
-----------------------------------
SELECT
	SUBSTRING('MySQL', 3, 3);
-----------------------------------
/*
Query di atas akan menghasilkan teks 'SQL', di mana fungsi substring akan
mengambil bagian teks sebanyak 3 karakter dari teks 'MySQL'
dimulai dari karakter ke-3.
*/
-----------------------------------
SELECT
	SUBSTRING('MySQL', 1, 2);
-----------------------------------
/*
Query di atas akan mengambil 2 karakter dari teks 'MySQL' dimulai dari
karkter ke-1. Hasilnya adalah karakter 'My'.
*/


/*
h. Fungsi trim(), ltrim(), rifht()
-----------------------------------
Berfungsi untuk mengilangkan whitespace (karakter kosong/ spasi).
Ini dilakukan untuk mengantisipasi jika seorang user/ operator memasukkan data
yang secara tidak sadar memasukkan spasi sebelum maupun sesudah karakter,
karena perbedaan karakter karena whitespace cukup berpengaruh pada
hasil query.
*/
-- Contoh 1
-----------------------------------
SELECT
	buku_isbn,
	buku_judul
FROM
	buku
WHERE
	TRIM(penerbit_id) = 'PB06';
-----------------------------------
/*
Jika ingin menghapus whitespace di sebelah kiri/ awal reim diganti dengan LTRIM()
dan jika ingin menghapus whitespace di sebelah kanan/ akhir diganti dengan RTRIM().
*/


/*
3. Fungsi untuk Bilangan
--------------------------
Berikut beberapa fungsi amtematika yanag sering digunakan pada MySQL

abs()		: Mengembalikan nilai mutlak dari n
			  Misal : abs(-10); akan mengembalikan nilai 10

round()		: Membulatkan bilangan desimal menjadi bilangan bulat
			  Misal : round(3.45); akan mengembalikan nilai 3

celling()	: Melakukan pembulatan ke atas ke bilangan terdekat
			  Misal : ceiling(3.25); akan mengembalikan nilai 4

floor()		: Melakukan pembulatan ke bawah ke bilangan terdekat
			  Misal : floor(3.97); akan mengembalikan nilai 3

mod(n, m)	: Disebut juga modulus, akan mengembalikan nilai hasil sisa
			  n dibagi dengan m. Misal : mod(11,4); akan mengembalikan nilai 3,
			  karena 11 dibagi 4 = 8 dan sisanya 3.
			  Fungsi mod bisa ditulis langsung seperti contoh 11 mod 4;
			  Untuk memperoleh hasil bagi bisa dengan cara 11 div 4

power(n, m)	: Mengembalikan nilai n pangkat m
			  Misal : power(10,2) sama dengan 10 pangkat 2, hasilnya 100

sqrt(n)		: Mengembalikan akar pangkat dua dari n
			  Misal : sqrt(4); akan mengembalikan nilai 2

rand(n)		: Mengembalikan nilai acak (random) antar 0 dan 1
			  Parameter n bersifat opsional (bisa disertakan, bis tidak)
*/


/*
4. Fungsi untuk Tanggal dan waktu
---------------------------------
Fungsi ini biasa digunakan untuk mencatat kapan suatu transaksi dilakukan.

Adapun daftar fungsinya sebagai berikut.
*/


/*
a. now()
----------
Berfungsi untuk mengembalikan nilai tanggal dan waktu saat ini.
*/
------------------
SELECT now();
------------------
-- Menghasilkan 2022-05-07 13:16:48 (contoh)


/*
b. curdate()
------------------
Berfungsi untuk mengembalikan tanggal saat ini.
*/
------------------
SELECT curdate();
------------------
-- Menghasilkan 2022-05-07 (contoh)


/*
c. curtime()
------------------
Berfungsi untuk mengembalikan nilai waktu saat ini.
*/
------------------
SELECT curtime();
------------------
-- Menghasilkan  13:17:28 (contoh)


/*
d. extract(day from tanggal)
------------------------------------
Berfungsi utnuk mengambil nilai hari dari suatu tanggal.
*/
--------------------------------------
SELECT extract(day from '2021-06-21');
--------------------------------------
-- Mengembalikan nilai 21


/*
e. extract(month from tanggal)
------------------------------------
Berfungsi untuk mengambil nilai bulan dari suatu tanggal.
*/
--------------------------------------
SELECT extract(month from '2021-06-21');
--------------------------------------
-- Mengembalikan nilai 6


/*
f. extract(year from tanggal)
------------------------------------
Berfungsi untuk mengambil nilai tahun dari suatu tanggal.
*/
--------------------------------------
SELECT extract(year from '2021-06-21');
--------------------------------------
-- Mengembalikan nilai 2021


/*
g. dayname(tanggal)
------------------------------------
Berfungsi untuk mengembalikan nama hari dari tanggal yang disertakan.
*/
--------------------------------------
SELECT dayname('2021-06-21');
--------------------------------------
-- Menghasilkan 'Monday'


/*
h. date_format(tanggal, format)
------------------------------------
Berfungsi untuk mengembalikan format tanggal yang dikehendaki
*/
--------------------------------------
SELECT date_format(now(), '%d/%m/%Y');
--------------------------------------
-- Menghasilkan 07/05/2022 (contoh)


/*
i. time_format(waktu, format)
------------------------------------
Mengembalikan format waktu yagn dikehendaki
*/
--------------------------------------
SELECT time_format(now(), '%h:%i:%s');
--------------------------------------
-- Menghasilkan 01:14:50 (contoh)


/*
5. Fungsi untuk Konversi type (typecasting)
--------------------------------------------
Typecasting adalah proses memerankan suatu data dengan tipe lain tertentu.

Proses typecasting tidak dapat diterapkan utnuk semua tipe data.

Tipe data yang akan diperankan sebagai tipe lain harus cocok,
semisal antara tipe data CHAR dicasting menjadi UNSIGNED.

Untuk keperluan typecasting ada 2 opsi fungsi yang bisa digunakan,
yaitu : cast() dan convert().

Format:
cast(ekspresi AS tipe);
convert(ekspresi, tipe);
*/
-- Contoh
----------------------------
SELECT CONVERT('13', SIGNED);
----------------------------
/*
Query di atas berfungsi memerankan teks '13' dalam tipe
bilangan bulat tak bertanda (UNSIGNED).

Berikut adalah tipe-tipe data yang bisa digunakan
dalam fungsi cast() dan conver().
1. BINARY
2. CHAR
3. DATE
4. DATETIME
5. SIGNED (INTEGER bertanda, bisa negatif)
6. UNSIGNED (INTEGER tak bertanda, selalu positif)
*/


/* ===================================== */
/*                 BAB 12                */
/* ------------------------------------- */
/* 			Prosedur dan Fungsi	 		 */
/* ------------------------------------- */
/* 										 */
/* ===================================== */

/*
Pendahuluan
------------
Prosedur dan Fungsi merupakan objek database yang berisi runtutan perintah untuk
melaksanakan satu tugas khusus tertentu.

Sekali dibuat, prosedur dan fungsi dapat digunakan secara berulang.

Sama halnya dengan view, prosedur dan fungsi disimpan dalam satu database tertentu,
maka jika database dihapus, prosedur dan fungsi di dalamnya juaga akan ikut terhapus.

Prosedur dan fungsi yang disimpan dalam database juga disebut sebagai
'stored procedure' dan 'stored function'.

Prosedur dan fungsi juga sering disebut sebagai subprogram.
*/


/*
Manfaat Prosedur dan Fungsi
------------------------------------
1. Sintaks menjadi lebih fleksibel
	Kita bisa menulis kode logis di dalam prosedur ataupun fungsi
	(bsia mengandung konstruksi pengulangan maupun percabangan)

2. Memiliki kemampuan untuk menangani kesalahan (error)
	Dengan prosedur maupun fungsi, kesalahan yang terjadi
	pada saat eksekusi prosedur	atau fungsi dapat ditangani
	dengan benar.

3. Pembungkusan kode (code packaging and encapsulation)
	Prosedur dan fungsi disimpan dalam server database. Dengan demikian,
	kode hanya ditulis sekali namun bisa digunakan oleh banyak aplikasi klien.

4. Mudah dipelihara
	Karena prosedur dan fungsi disimpan di server database, maka suatu saat jika
	terjadi perubahan proses dari sub-program tersebut, kita hanya mengubah sekali.
*/


/*
Perbedaan Prosedur dan Fungsi
------------------------------------
* Perbedaan paling mendasar antara prosedur dan fungsi terletak pada peruntukannya.

1. Prosedur tidak bisa mengembalikan nilai
	Prosedur hanya melakukan suatu proses operasi tertentu.
	Prosedur dieksekusi menggunakan perintah CALL.

2. Fungsi adalah subprogram yang mengembalikan nilai
	Cara mengeksekusinya dengan meletakkan nama fungsinya (beserta parameternya, jika ada)
	Pemanggilan fungsi sama seperti penggunaan variabel d an kosntanta.

3. Fungsi tidak dapat dieksekusi menggunakan perintah CALL
	Begitupun sebaliknya, prosedur tidak bisa dieksekusi di dalam ekspresi.

4. Parameter-parameter yang didefinisikan di dalam prosedur dapat bersifat sebagai
	parameter masukan (input-only), parameter keluaran (output-only) maupun gabungan
	dari keduanya (parameter masukan-keluaran).

	Karena alasan tersebut, sebenarnya prosedur dapat mengembalikan nilai, asalkan nilai tersebut
	ditampung ke dalam parameter keluaran. Fungsi hanya memiliki parameter keluaran.

5. Karena fungsi merupakan subprogram yang mengembalikan nilai, maka saat pembuatannya
	harus menggunakan klausa RETURNS di bagian kepala atau judul fungsi dan diikuti dengan
	tipe data dari nilai yagn akan dikembalikan.

	Di bagian akhir badan fungsi juga perlu menggunakan klausa RETURN untuk mengembalikan
	nilai yang diproleh dari proses yang telah dilakukan oleh fungsi.

	Klausa RETURNS dan RETURN tidak ditemukan saat mendeklarasikan prosedur.
*/


/*
Membuat dan Mengeksekusi Prosedur
------------------------------------
Prosedur dapat memiliki satu atau lebih perintah yang dikumpulkan menjadi satu kelompok.
Oleh karena itu kita perlu mengguanakn blok BEGIN-END.
Setiap perintah dalam prosedur harus dipisahkan menggunakan tanda semicolon (;).
*/

-- Contoh Prosedur tanpa parameter
------------------------------------
DELIMITER //
CREATE PROCEDURE select_penerbit()
BEGIN
	SELECT penerbit_nama
	FROM penerbit
	WHERE penerbit_id = 'PB06';
END;
//
------------------------------------
-- Berikut cara mengeksekusi prosedur 'select_penerbit'
------------------------------------
CALL select_penerbit(); //
------------------------------------
-- Prosedur tersebut akan menampilkan penerbit dari tabel penerbit dengan kode 'PB06'


-- Contoh Prosedur yang menggunakan parameter
----------------------------------------------
DELIMITER //
CREATE PROCEDURE insert_penerbit(id char(4), nama varchar(50))
BEGIN
	INSERT INTO penerbit (penerbit_id, penerbit_nama)
	VALUES (id, nama);
END
//
----------------------------------------------

-- Untuk mengeksekusi prosedur tersebut gunakan query berikut
----------------------------------------------
CALL insert_penerbit('PB10', 'Sinar Terang'); //
----------------------------------------------

-- Untuk mengecek hasilnya gunakan query berikut
----------------------------------------------
SELECT * FROM penerbit;
----------------------------------------------
/*
Baris data terakhir merupakan hasil insert
yang dilakukan oleh prosoedur insert_penerbit().
*/


/*
Membuat dan Mengeksekusi Fungsi
------------------------------------
Sintaks untuk membuat funugsi berbeda dengan prosedur, yaitu menggunakan
CREATE FNCTION, selain itu juga perlu menambahkan RETURNS untuk mendefinisikan
tipe data kembalian serta diakhiri dengan RETURN untuk mengembalikan nilai

Format Pembuatan Function sebagai berikut
-----------------------------------------------------
CREATE FUNCTION <nama_fungsi> ([daftar parameter])
RETURNS <tipe data>
BEGIN
	[daftar deklarasi variabel]
	<perintah 1>;
	<perintah 2>;
	dst...
	RETURN <nilai kembalian>;
END;
-----------------------------------------------------
*/
------------------------------------
DELIMITER //
CREATE FUNCTION harga_buku(isbn CHAR(13))
	RETURNS DECIMAL(10,0) DETERMINISTIC
BEGIN

	-- Mendeklarasikan variabel
	DECLARE harga DECIMAL(10,0);

	-- Seleksi data dan menampung hasilnya ke dalam variabel
	SELECT buku_harga INTO harga
	FROM buku
	WHERE buku_isbn = isbn;

	-- Mengembalikan nilai hasil proses
	RETURN harga;

END;
//
------------------------------------

-- Kita bisa mengeksekusi fungsi tersebut dengan query berikut
------------------------------------
SELECT harga_buku('222-34222-1-0');
------------------------------------

-- Untuk mengganti judul kolom, kita bisa menggunakan alias
------------------------------------
SELECT harga_buku('222-34222-1-0') AS 'Harga Buku';
------------------------------------

-- Fungsi juga bisa langsung dieksekusi di dalam ekspresi
------------------------------------
SELECT harga_buku('222-34222-1-0') * 2 AS 'Harga Buku';
------------------------------------
/*
Pada contoh di atas fungsi langsung digabungkan dengan ekspresi perkalian
Kesimpulannya, fungsi bisa digunakan sebagaimana variabel normal.
*/

/*
Menghapus Prosedur dan Fungsi
------------------------------------
*/

-- Menghapus Prosedur
------------------------------------
DROP PROCEDURE select_penerbit;
------------------------------------

-- Menghapus Fungsi
------------------------------------
DROP FUNCTION harga_buku;
------------------------------------


/*
Menampilkan daftar Prosedur dan Fungsi dalam database
------------------------------------------------------------
Pada saat tertentu terkadang kita ingin mengetahui daftar prosedur dan fungsi
yang terdapat dalam database kita, maka berikut query yang bisa kita jalankan.
*/
--------------------------------------
SHOW PROCEDURE STATUS;
--------------------------------------
/*
Query di atas berfungsi untuk menampilkan seluruh prosedur yang tersimpan
di dalam database beserta properti dan informasi metadata lainnya.
*/

--------------------------------------
SHOW PROCEDURE STATUS
WHERE Name Like 'insert%';
--------------------------------------
/*
Query di atas berfungsi untuk menampilkan prosedur berdasarkan filter
yang dilakukan dengan klausa LIKE.
*/

--------------------------------------
SHOW FUNCTION STATUS;
--------------------------------------
/*
Query di atas berfungsi untuk menampilkan seluruh fungsi yang tersimpan
di dalam database beserta properti dan informasi metadata lainnya.
*/

--------------------------------------
SHOW FUNCTION STATUS
WHERE Name Like 'harga%';
--------------------------------------
/*
Query di atas berfungsi untuk menampilkan fungsi berdasarkan filter
yang dilakukan dengan klausa LIKE.
*/


/*
Hak Akses untuk bekerja dengan Prosedur dan Fungsi
-----------------------------------------------------------
1. Untuk membuat prosedur maupun fungsi kita memerlukan hak akses
	CREATE ROUTINE

2. Untuk mengeksekusi prosedur maupun fungsi kita memerlukan akses
	EXECUTE

3. Untuk mengubah prosedur maupun fungsi kita perlu memiliki akses
	ALTER ROUTINE
*/


/*
Variabel di dalam Prosedur dan Fungsi
------------------------------------------------
Untuk membuat satu variabel atau lebih di dalam prosedur maupun fungsi
kita bisa menggunakan query DECLARE diikuti nama variable dan tipe data

Format 	:
DECLARE <nama_variable> <tipe_data>;
*/
-- Contoh 	:
-----------------------------
DECLARE harga DECIMAL(10,0);
-----------------------------

/*
Pada contoh di atas, kita mendeklarasikan variabel harga dengan lebar data 10.

DECLARE harus dimasukkan ke dalam blok BEGIN-END

Untuk proses penginisialisasi variable bisa menggunakan SET untuk mengisi
nilai awal sebuah variabel.
*/

-- Contoh:
-----------------------------
DECLARE harga DECIMAL(10,0);
SET harga = 0;
-----------------------------
/*
Untuk menampung suatu nilai yang diambil dari tabel database
bisa menggunakan query INTO.
*/

-- Contoh:
---------------------------------
BEGIN
	...
	SELECT buku_harga INTO harga
	FROM
		buku
	WHERE
		buku_isbn = isbn;
	...
END;
---------------------------------
/*
Pada contoh query di atas nilai yang diambil menggunakan query SELECT
dimasukkan ke dalam variabel harga dengan query INTO.
*/


/*
Pemilihan dalam Prosedur dan Fungsi
------------------------------------
Untuk menjalankan sebuah aksi di dalam blok kode, MySQL menyediakan
perintah IF dan CASE.

Aksi akan dijalankan jika kondisi yang didefinisikan bernilai true.
*/

/*
-- Perintah IF (Jika)
---------------------------------
Format 1 (terdiri dari 1 kondisi) 
-------------------
IF <kondisi> THEN
	<daftar aksi>
END IF
-------------------

Format 2 (Terdiri dari beberapa kondisi)
--------------------------------
IF <kondisi1> THEN
	<daftar aksi1>
[ELSEIF <kondisi2> THEN]
	<daftar aksi2>
[ELSE <daftar aksi3>]
END IF
--------------------------------
Pada format 2, jika kondisi 1 bernilai benar, maka <daftar aksi 1> akan dijalankan,
jika tidak, apabila kondisi bernilai benar, maka <daftar aksi 2> yang akan dijalankan,
jika kondisi 1 dan kondisi 2 bernilai salah, maka daftar aksi 3 yang akan dijalankan.
*/
-- Contoh
----------------------------------------------
DELIMITER //
CREATE FUNCTION get_penerbit(isbn CHAR(13))

	RETURNS VARCHAR(50) DETERMINISTIC

BEGIN

	DECLARE namapenerbit VARCHAR(50);
	SELECT b.penerbit_nama INTO namapenerbit
	FROM
		buku a, penerbit b
	WHERE
		a.penerbit_id = b.penerbit_id AND
		a.buku_isbn = isbn;

	IF namapenerbit IS NULL THEN
		SET namapenerbit = '';
	END IF;

	RETURN namapenerbit;
END;
//
----------------------------------------------
/*
Pada fungsi IF di atas, jika nama penerbitnya tidak ada,
maka akan dikembalikan berupa karakter kosong.
*/

-- Untuk mengeksekusi fungsi di atas gunakan query berikut
----------------------------------------------
SELECT get_penerbit('222-34222-1-0'); //
----------------------------------------------


-- Perintah CASE
-----------------
/*
-- Format 
---------------------------------------
CASE <ekspresi>
	WHEN <nilai 1> THEN <daftar aksi 1>;
	[WHEN <nilai 2> THEN <daftar aksi 2>;]
	...
	[ELSE] <daftar aksi 3>
END CASE
---------------------------------------
*/

-- Contoh penggunaan CASE
---------------------------------------
DELIMITER //
CREATE FUNCTION ubah_format_tanggal(tanggal DATE)
	RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
	DECLARE dd INT(2);
	DECLARE mm INT(2);
	DECLARE yy INT(4);
	DECLARE bulan VARCHAR(9);
	SET dd = extract(day FROM tanggal);
	SET mm = extract(month from tanggal);
	SET yy = extract(year FROM tanggal);

	CASE mm
		WHEN 1 THEN SET bulan = 'Januari';
		WHEN 2 THEN SET bulan = 'Februari';
		WHEN 3 THEN SET bulan = 'Maret';
		WHEN 4 THEN SET bulan = 'April';
		WHEN 5 THEN SET bulan = 'Mei';
		WHEN 6 THEN SET bulan = 'Juni';
		WHEN 7 THEN SET bulan = 'Juli';
		WHEN 8 THEN SET bulan = 'Agustus';
		WHEN 9 THEN SET bulan = 'September';
		WHEN 10 THEN SET bulan = 'Oktober';
		WHEN 11 THEN SET bulan = 'November';
		WHEN 12 THEN SET bulan = 'Desember';
	END CASE;

	RETURN CONCAT(
			CONVERT(dd, CHAR),' ',bulan,' ',CONVERT(yy, CHAR));
END;
//
---------------------------------------

-- Untuk mengeksekusi fungsi di atas bisa dimasukkan dalam query select berikut
---------------------------------------
SELECT
	buku_judul AS 'Judul',
	ubah_format_tanggal(buku_tglterbit) AS 'Tanggal Terbit',
	buku_harga AS 'Harga'
FROM
	buku; //
---------------------------------------


/*
Pengulangan dalam Prosedur dan Fungsi
---------------------------------------
Satu atau beberapa aksi dapat dieksekusi secara berulang menggunakan blok perulangan.

Di antara blok perulangan yang ada di dalam MySQL adalah:
1. LOOP
2. WHILE
3. REPEAT
*/

-- Perintah LOOP
------------------
/*
Loop adalah bentuk perulangan yang tidak memiliki kondisi, hal ini berarti
proses perulangan akan dijalankan secara terus menerus selama tidak ada
perintah untuk menghentikan proses perulangan.

Di dalam MySQL menyediakan perintah LEAVE untuk mengehentikan perulangan tersebut.

Berikut format Loop
--------------------
LOOP
	<daftar aksi>;
END LOOP
--------------------
*/

-- Contoh LOOP
------------------------------------------------------
DELIMITER //
CREATE FUNCTION jumlahkan(n INT)
	RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 0;
	DECLARE total INT DEFAULT 0;
	myloop: LOOP
		SET i = i + 1;
		IF i > n THEN
			LEAVE myloop; -- Keluar dari perulangan
		END IF;
		SET total = total + i;
	END LOOP myloop;

	RETURN total;
END
//
------------------------------------------------------
/*
Pada query di atas kita memberi label pada badan perulangan dengan nama 'myloop'.

Fungsi yang dibuat di atas berguna untuk menjumlahkan n buah bilangan positif pertama.
Sebagai contoh, jika n bernilai 5 maka hasilnya adalah 15 (berasal dari 1+2+3+4+5).
*/
-- Untuk mengeksekusi fungsi di atas, kita dapat menulis query berikut.
------------------------
SELECT jumlahkan(5); //
------------------------


-- Perintah WHILE
------------------
/*
Perintah WHILE merupakan bentuk perintah untuk melakukan perulangan dengan cara memeriksa
kondisi tertentu.

Dalam perintan WHILE, kondisi tertentu akan ditempatkan di awal blok.

Dengan demikian, aksi yang berada di dalam badan perulangan hanya dieksekusi jika
kondisi tersebut terpenuhi (bernilai benar).

Jika kondisi bernilai salah, maka blok perulangan akan diabaikan dan proses eksekusi
dilanjutkan ke aksi setelah blok perulangan (jika ada).

Berikut format perulangan WHIlE
-----------------------------
WHILE <kondisi>
	<daftar aksi>;
END WHILE
-----------------------------
*/
-- Contoh Perulangan WHILE
------------------------------------------
DELIMITER //
CREATE FUNCTION jumlahkan_while(n INT)
	RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE total INT DEFAULT 0;
	WHILE (i <= n) DO
		SET total = total + i;
		SET i = i + 1;
	END WHILE;

	RETURN total;
END;
//
------------------------------------------
/*
Fungsi di atas merupakan modifikasi dari fungsi sebelumnya, yaitu LOOP.
Namun dimodifikasi menggunakan WHILE.

Untuk mengeksekusi fungsi WHILE tersebut kita gunakan contoh query berikut.
*/
-----------------------------------------
SELECT jumlahkan_while(5); //
-----------------------------------------


-- Perintah REPEAT
-------------------
/*
Perintah REPEAT sebenarnya hampir sama dengan WHILE, hanya saja berbeda pada
penempatan kondisinya saja.

Jika WHILE kondisinya ditempatkan di awal blok perulangan, tetapi untuk REPEAT
kondisi ditempatkan di akhir blok perulangan.

Dengan demikian, dalam perintah REPEAT aksi minimal akan dieksekusi satu kali.

Berikut format penulisan perintah REPEAT
-----------------------
REPEAT
	<daftar aksi>;
UNTIL <kondisi>
END REPEAT
-----------------------
*/
-- Contoh perintah REPEAT
---------------------------------------
DELIMITER //
CREATE FUNCTION jumlahkan_repeat(n INT)
	RETURNS INT(11) DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE total INT DEFAULT 0;
	REPEAT
		SET total = total + i;
		SET i = i + 1;
	UNTIL (i > n)
	END  REPEAT;
	RETURN total;
END;
//
---------------------------------------
-- Kita bisa mengeksekusi fungsi di atas dengan query
---------------------------------------
SELECT jumlahkan_repeat(5); //
---------------------------------------
-- Cara kerja fungsi REPEAT tersebut sama dengan WHILE dan LOOP sebelumnya


-- Perintah LEAVE dan ITERATE
------------------------------
/*
Proses perulangan dapat dipaksa untuk berhenti atau untuk diteruskan menggunakan
pernyataan loncat (jump statement).

Perintah untuk menghentikan perulangan adalah LEAVE, sedangkan untuk melanjutkan
perulangan adalah ITERATE.

Contoh penggunaan LEAVE sudah kita contohkan dalam penggunaan LOOP.

Berikut contoh penggunaan keduanya.
*/
-- Contoh penggunaan LEAVE dan ITERATE
------------------------------------
DELIMITER //
CREATE PROCEDURE tampilkan_bil_genap(n INT)
BEGIN

	DECLARE i INT DEFAULT 0;
	DECLARE str VARCHAR(200) DEFAULT '';

	next: LOOP

		SET i = i + 1;
		IF (i mod 2 = 1) THEN
			ITERATE next;
		END IF;

		IF (i > n) THEN
			LEAVE next;
		END IF;

		SET str = CONCAT(str, CONVERT(i, CHAR), ' ');

	END LOOP next;

	SELECT str AS 'Bilangan Genap';

END;
//
------------------------------------
/*
Pada kode di atas kita membuat sebuat prosedur yang dapat menampilkan bilangan genap
yang terdapat di antara bilangan 1 dan n.

Nilai n dittntukan saat pemanggilan prosedur.

Untuk memriksa hasil dari prosedur di atas jalankan query berikut.
*/
-- Eksekusi prosedur 'tampilkan_bil_genap'
------------------------------------------
CALL tampilkan_bil_genap(50); //
------------------------------------------
-- Query di atas akan menampilkan seluruh bilangan genap antara 1 s.d. 50



-- 	============================
		To be Continued
-- 	============================
-- Trigger
-- Ekspor dan Impor Data
-- MySQL dan Python
-- MySQL dan PHP
-- Membuat Aplikasi Web dengan MySQL dan PHP
