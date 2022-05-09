# Pembuatan Database
# ===================

# Import library mysql
import mysql.connector

# Pendefinisian server mysql
try:
	conn = mysql.connector.connect(
		host='localhost',
		user='root',
		password='root'
		)

	cur = conn.cursor()

	# Membuat database
	cur.execute('CREATE DATABASE python_db')
	cur.close()
except mysql.connector.Error as e:
	print('Pembuatan database gagal!')
	print('ERROR: %s' % e)
else:
	print('Pembuatan database berhasil!')
	conn.close()