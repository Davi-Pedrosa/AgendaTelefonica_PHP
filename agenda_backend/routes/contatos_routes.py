from flask import Blueprint, request, jsonify
from database import SessionLocal
from models import Contato

contatos_bp = Blueprint("contatos", __name__)
session = SessionLocal()

@contatos_bp.route("/contatos", methods=["GET"])
def listar_contatos():
    contatos = session.query(Contato).all()
    return jsonify([{
        "id": c.id,
        "nome": c.nome,
        "telefone1": c.telefone1,
        "telefone2": c.telefone2,
        "email": c.email,
        "categoria_id": c.categoria_id
    } for c in contatos])

@contatos_bp.route("/contatos", methods=["POST"])
def adicionar_contato():
    data = request.get_json()
    novo = Contato(
        nome=data["nome"],
        telefone1=data["telefone1"],
        telefone2=data.get("telefone2"),
        email=data["email"],
        categoria_id=data.get("categoria_id")
    )
    session.add(novo)
    session.commit()
    return jsonify({"message": "Contato adicionado com sucesso!"})

@contatos_bp.route("/contatos/<int:id>", methods=["PUT"])
def atualizar_contato(id):
    data = request.get_json()
    contato = session.query(Contato).filter(Contato.id == id).first()
    if not contato:
        return jsonify({"error": "Contato não encontrado"}), 404

    contato.nome = data.get("nome", contato.nome)
    contato.telefone1 = data.get("telefone1", contato.telefone1)
    contato.telefone2 = data.get("telefone2", contato.telefone2)
    contato.email = data.get("email", contato.email)
    contato.categoria_id = data.get("categoria_id", contato.categoria_id)
    session.commit()

    return jsonify({"message": "Contato atualizado com sucesso!"})

@contatos_bp.route("/contatos/<int:id>", methods=["DELETE"])
def deletar_contato(id):
    contato = session.query(Contato).filter(Contato.id == id).first()
    if not contato:
        return jsonify({"error": "Contato não encontrado"}), 404

    session.delete(contato)
    session.commit()
    return jsonify({"message": "Contato deletado!"})
