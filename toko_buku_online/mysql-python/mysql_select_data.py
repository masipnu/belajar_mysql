import mysql.connector

try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root',
		database='python_db'
		)

	cur = conn.cursor()

	sql = "SELECT * FROM penulis"
	cur.execute(sql)

	rs = cur.fetchall()

	# Menampilkan data versi 1
	# -------------------------
	# for (id, nama) in rs:
		# print("%s\t%s" % (id, nama))

	# Menampilkan data versi 2
	# ------------------------
	for row in rs:
		print("%s\t%s" % (row[0], row[1]))

	cur.close()
except mysql.connector.Error as e:
	print("ERROR: %s" % e)
else:
	conn.close()