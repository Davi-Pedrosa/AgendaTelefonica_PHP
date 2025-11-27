class Contact {
  final int? id;
  final String nome;
  final String telefone1;
  final String telefone2;
  final String email;

  Contact({
    this.id,
    required this.nome,
    required this.telefone1,
    required this.telefone2,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'nome': nome,
      'telefone1': telefone1,
      'telefone2': telefone2,
      'email': email,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      telefone1: map['telefone1'] as String,
      telefone2: map['telefone2'] as String,
      email: map['email'] as String,
    );
  }

  Contact copyWith({
    int? id,
    String? nome,
    String? telefone1,
    String? telefone2,
    String? email,
  }) {
    return Contact(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      telefone1: telefone1 ?? this.telefone1,
      telefone2: telefone2 ?? this.telefone2,
      email: email ?? this.email,
    );
  }
}

