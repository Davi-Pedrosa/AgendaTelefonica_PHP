from flask import Flask
from flask_cors import CORS
from database import Base, engine
from routes.contatos_routes import contatos_bp
from routes.categorias_routes import categorias_bp

app = Flask(__name__)
CORS(app)

# cria as tabelas se não existir
Base.metadata.create_all(bind=engine)

# registra as rotas
app.register_blueprint(contatos_bp)
app.register_blueprint(categorias_bp)

@app.route("/")
def index():
    return {"message": "API da Agenda Telefônica ativa!"}

if __name__ == "__main__":
    app.run(debug=True)
