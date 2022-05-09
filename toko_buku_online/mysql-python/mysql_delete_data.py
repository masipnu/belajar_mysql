import mysql.connector

try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root',
		database='python_db'
		)

	cur = conn.cursor()

	# Menghapus data dengan id=5
	sql = "DELETE FROM penulis " + \
			"WHERE id=5"
	cur.execute(sql)
	print("Data berhasil dihapus!")
	conn.commit()

	cur.close()
except mysql.connector.Error as e:
	print("ERROR: %s" % e)
else:
	conn.close()