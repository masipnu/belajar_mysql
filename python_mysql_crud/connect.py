import mysql.connector

db = mysql.connector.connect(
	host="localhost",
	user="root",
	passwd="root"
	)

if db.is_connected():
	print("Berhasil terhubung ke database")