import mysql.connector

db = mysql.connector.connect(
	host = "localhost",
	user = "root",
	passwd = "root"
	)

cursor = db.cursor()
cursor.execute("CREATE DATABASE toko_mainan")

print("Database berhasil dibuat!")