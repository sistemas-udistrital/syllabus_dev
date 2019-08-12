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

@app.route('/add_syllabus', methods = ['POST', 'GET'])
def add_syllabus():
    if request.method == 'POST':
        nombre = request.form['nombre']
        codigo = request.form['codigo']
        proyecto = int(request.form['proyecto'])
        docente = int(request.form['docente'])

        conn = mysql.connect()
        cur = conn.cursor()

        cur.execute("INSERT INTO espacio_academico (esa_nombre,esa_codigo,prc_id,doc_id) VALUES (%s,%s,%s,%s)",(nombre,codigo,proyecto,docente) )
        conn.commit()

        msg = "Record successfully added"
        title = "Agregar syllabus"
        return render_template("result.html",msg = msg, title = title)
    else:
        conn = mysql.connect()
        cur = conn.cursor()
        campos = "prc_id, prc_nombre, prc_codigo";
        cur.execute("select " + campos + " from proyecto_curricular")
        title = "Agregar syllabus"
        rows_proyectos = cur.fetchall();
        campos = "doc_id, doc_nombre, doc_apellido";
        cur.execute("select " + campos + " from docente")
        rows_docentes = cur.fetchall();
        return render_template('add_syllabus.html',proyectos = rows_proyectos, docentes = rows_docentes, title = title)

@app.route('/add_docente', methods = ['POST', 'GET'])
def add_docente():
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        email = request.form['email']
        documento = request.form['documento']

        conn = mysql.connect()
        cur = conn.cursor()

        cur.execute("INSERT INTO docente (doc_nombre,doc_apellido,doc_email,doc_documento) VALUES (%s,%s,%s,%s)",(nombre,apellido,email,documento) )
        conn.commit()

        msg = "Record successfully added"
        title = "Agregar docente"
        return render_template("result.html",msg = msg, title = title)
    else:
        title = "Agregar docente"
        return render_template('add_docente.html', title = title)

if __name__ == '__main__':
    app.run(debug = True)
