import mysql.connector

db = mysql.connector.connect(
	host = "localhost",
	user = "root",
	passwd = "root",
	database = "toko_mainan"
	)

cursor = db.cursor()
sql = "SELECT * FROM customers"
cursor.execute(sql)

result = cursor.fetchmany(3)

for data in result:
	print(data)