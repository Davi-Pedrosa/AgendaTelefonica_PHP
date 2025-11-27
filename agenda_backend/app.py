from flask import Flask, request, jsonify
from supabase_client import supabase
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Permite PHP acessar o backend


# GET- Lista todos os contatos
@app.get("/contatos")
def listar_contatos():
    response = supabase.table("contatos").select("*").execute()
    return jsonify(response.data), 200

# POST- Cria novo contato
@app.post("/contatos")
def criar_contato():
    data = request.json

    novo = {
        "nome": data.get("nome"),
        "telefone1": data.get("telefone1"),
        "telefone2": data.get("telefone2"),
        "email": data.get("email")
    }

    response = supabase.table("contatos").insert(novo).execute()
    return jsonify(response.data), 201

# PUT- Atualiza contato por ID
@app.put("/contatos/<id>")
def atualizar_contato(id):
    data = request.json

    update_data = {
        "nome": data.get("nome"),
        "telefone1": data.get("telefone1"),
        "telefone2": data.get("telefone2"),
        "email": data.get("email")
    }

    response = (
        supabase.table("contatos")
        .update(update_data)
        .eq("id", id)
        .execute()
    )

    return jsonify(response.data), 200

# DELETE- Remove contato
@app.delete("/contatos/<id>")
def deletar_contato(id):
    response = (
        supabase.table("contatos")
        .delete()
        .eq("id", id)
        .execute()
    )

    return jsonify({"mensagem": "Contato removido com sucesso"}), 200


# Roda backend
if __name__ == "__main__":
    app.run(debug=True)
