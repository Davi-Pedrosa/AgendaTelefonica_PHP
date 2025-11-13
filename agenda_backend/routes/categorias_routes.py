from flask import Blueprint, request, jsonify
from database import SessionLocal
from models import Categoria

categorias_bp = Blueprint("categorias", __name__)
session = SessionLocal()

@categorias_bp.route("/categorias", methods=["GET"])
def listar_categorias():
    categorias = session.query(Categoria).all()
    return jsonify([{"id": c.id, "nome": c.nome} for c in categorias])

@categorias_bp.route("/categorias", methods=["POST"])
def adicionar_categoria():
    data = request.get_json()
    nova = Categoria(nome=data["nome"])
    session.add(nova)
    session.commit()
    return jsonify({"message": "Categoria adicionada!"})
