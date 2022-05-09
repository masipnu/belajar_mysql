import mysql.connector

try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root',
		database='python_db'
		)

	cur = conn.cursor()

	ddl = """
		CREATE TABLE penulis (
		id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
		nama VARCHAR(25)
		)
		"""
			
	cur.execute(ddl)
	cur.close()

except mysql.connector.Error as e:
	print('Pembuatan tabel gagal!')
	print('ERROR: %s' % e)
else:
	print('Pembuatan tabel berhasil!')
	conn.close()