from flask import Flask, render_template, json, request
from flaskext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash

mysql = MySQL()
app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'apdaza3297'
app.config['MYSQL_DATABASE_DB'] = 'syllabusdb'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql.init_app(app)


@app.route('/')
def main():
    conn = mysql.connect()
    cur = conn.cursor()
    cur.execute("select * from proyecto_curricular")
    rows = cur.fetchall();
    return render_template('index.html',rows = rows)

if __name__ == '__main__':
    app.run(debug = True)
