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

@app.route('/proyectos')
def proyectos():
    conn = mysql.connect()
    cur = conn.cursor()
    campos = "prc_id, prc_nombre, prc_codigo";
    titulos = [x[4:] for x in campos.split(", ")]
    cur.execute("select " + campos + " from proyecto_curricular")
    title = "Proyectos curriculares"
    rows = cur.fetchall();
    return render_template('list_proyectos.html',rows = rows, title = title, titles = titulos)

@app.route('/docentes')
def docentes():
    conn = mysql.connect()
    cur = conn.cursor()
    campos = "doc_id, doc_nombre, doc_apellido, doc_documento, doc_email";
    titulos = [x[4:] for x in campos.split(", ")]
    cur.execute("select " + campos + " from docente")
    title = "Docentes"
    rows = cur.fetchall();
    return render_template('list_docentes.html',rows = rows, title = title, titles = titulos)

@app.route('/syllabus')
def syllabus():
    conn = mysql.connect()
    cur = conn.cursor()
    campos = "esa_id, esa_nombre, esa_codigo, prc_nombre";
    titulos = [x[4:] for x in campos.split(", ")]
    cur.execute("select " + campos + " from espacio_academico e inner join proyecto_curricular p on e.prc_id = p.prc_id")
    title = "Syllabus"
    rows = cur.fetchall();
    return render_template('list_syllabus.html',rows = rows, title = title, titles = titulos)


if __name__ == '__main__':
    app.run(debug = True)
