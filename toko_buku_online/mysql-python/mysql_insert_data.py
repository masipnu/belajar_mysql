import mysql.connector

try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root',
		database='python_db'
		)

	cur = conn.cursor()

	penulis = [
				'Ferdian',
				'Andrian',
				'Akhmad Ilman',
				'Muhammad Salman',
				'Sandi Hasan'
	]

	for nama in penulis:
		sql = "INSERT INTO penulis(nama) " + \
				"VALUES('" + nama + "')"
		cur.execute(sql)
		print("Berhasil: %s" % sql)
		conn.commit()

	cur.close()
except mysql.connector.Error as e:
	print('ERROR: %s' % e)
else:
	conn.close()