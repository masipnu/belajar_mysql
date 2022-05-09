import mysql.connector
import os

db = mysql.connector.connect(
	host = "localhost",
	user = "root",
	passwd = "root",
	database = "toko_mainan"
	)


def insert_data(db):
	name = input("Masukkan nama : ")
	address = input("Masukkan alamat : ")
	val = (name, address)
	cursor = db.cursor()
	sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
	cursor.execute(sql, val)
	db.commit()
	print("{} data berhasil disimpan".format(cursor.rowcount))


def show_data(db):
	cursor = db.cursor()
	sql = "SELECT * FROM customers"
	cursor.execute(sql)
	result = cursor.fetchall()

	if cursor.rowcount < 0:
		print("Tidak ada data!")
	else:
		for data in result:
			print(data)


def update_data(db):
	cursor = db.cursor()
	show_data(db)
	customer_id = input("Pilih id customer >")
	name = input("Nama baru : ")
	address = input("Alamat baru : ")

	sql = "UPDATE customers SET name=%s, address=%s WHERE customer_id=%s"
	val = (name, address, customer_id)
	cursor.execute(sql, val)
	db.commit()
	print("{} data berhasil diubah".format(cursor.rowcount))


def delete_data(db):
	cursor = db.cursor()
	show_data(db)
	customer_id = input("Pilih id customer > ")
	sql = "DELETE FROM customers WHERE customer_id=%s"
	val = (customer_id,)
	cursor.execute(sql, val)
	db.commit()
	print("{} data berhasil dihapus".format(cursor.rowcount))


def search_data(db):
	cursor = db.cursor()
	keyword = input("Kata kunci : ")
	sql = "SELECT * FROM customers WHERE name LIKE %s OR address LIKE %s"
	val = ("%{}%".format(keyword), "%{}%".format(keyword))
	cursor.execute(sql, val)
	result = cursor.fetchall()

	if cursor.rowcount < 0:
		print("Data tidak ditemukan")
	else:
		for data in result:
			print(data)


def show_menu(db):
		print("--------------------------------")
		print("=== Aplikasi Database Python ===")
		print("--------------------------------")
		print("1. Tambah Data")
		print("2. Tampilkan Data")
		print("3. Ubah Data")
		print("4. Hapus Data")
		print("5. Cari Data")
		print("0. Keluar")
		print("--------------------------------")
		menu = input("Pilih menu > ")

		#clear screen
		os.system("cls")

		if menu == "1":
			insert_data(db)
		elif menu == "2":
			show_data(db)
		elif menu == "3":
			update_data(db)
		elif menu == "4":
			delete_data(db)
		elif menu == "5":
			search_data(db)
		elif menu == "0":
			exit()
		else:
			print("Menu salah!")


if __name__ == '__main__':
	while(True):
		show_menu(db)