import 'dart:convert';

class UsuarioModelo {
  int? _id;
  String? _nomeUsuario;
  String? _email;
  String? _password;

  UsuarioModelo({
    id,
    nomeUsuario,
    email,
    password,
  }) {
    _id = id;

    _email = email;
    _nomeUsuario = nomeUsuario;
    _password = password;
  }

  // Método get e set de id
  int get id => _id ?? 0;
  set id(int? valor) {
    _id = valor ?? 0;
  }

  // Método get e set de nome
  String get nomeUsuario => _nomeUsuario ?? '';
  set nomeUsuario(String? valor) {
    _nomeUsuario = valor ?? '';
  }

  // Método get e set de email
  String get email => _email ?? '';
  set email(String? valor) {
    _email = valor ?? '';
  }

  // Método get e set de password
  String get password => _password ?? '';
  set password(String? valor) {
    _password = valor ?? '';
  }

  // Método que pegar um json(Map) e retorna um novo objeto de UsuárioModelo
  factory UsuarioModelo.fromJson(Map<String, dynamic> json,
      {bool useUtf8 = true}) {
    return UsuarioModelo(
        id: json['id'],
        email: json['email'],
        password: json['password'],
        nomeUsuario: !useUtf8
            ? json['nome_usuario']
            : json['nome_usuario'] != null
                ? utf8.decode(json['nome_usuario'].toString().codeUnits)
                : '');
  }

  // Método que retorna o objeto transformado em json(String)
  toJson() {
    return jsonEncode({
      'id': id,
      'nome_usuario': nomeUsuario,
      'email': email,
      'password': password,
    });
  }
}
