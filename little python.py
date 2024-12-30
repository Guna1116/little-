import mysql.connector

# Connect to the database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="LittleLemon"
)
cursor = conn.cursor()

# Test query
cursor.execute("SELECT * FROM Customers;")
for row in cursor.fetchall():
    print(row)

conn.close()
