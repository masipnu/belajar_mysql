import mysql.connector

try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root',
		database='python_db'
		)

	cur = conn.cursor()

	# Mengubah data dengan ID=1
	sql = "UPDATE penulis " + \
			"SET nama = 'Adi Susanto' " + \
			"WHERE id=1"
	cur.execute(sql)
	print("Data berhasil diubah")
	conn.commit()

	cur.close()
except mysql.connector.Error as e:
	print("ERROR: %s" % e)
else:
	conn.close()