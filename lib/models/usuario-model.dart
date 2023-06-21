// Importa a biblioteca dart:convert para usar o jsonEncode e o jsonDecode
import 'dart:convert';

// Define uma classe para modelar os dados de um produto
class UsuarioModelo {
  // Declarando quatro variáveis privadas para armazenar os atributos do produto
  int? _id;
  String? _nomeUsuario;
  String? _email;
  String? _password;

  // Define um construtor que recebe os valores dos atributos como parâmetros opcionais
  UsuarioModelo({
    id,
    nomeUsuario,
    email,
    password,
  }) {
    // Atribuindo os valores dos parâmetros às variáveis privadas, se algum parâmetro for nulo, o atributo recebe um valor padrão
    _id = id;
    _email = email;
    _nomeUsuario = nomeUsuario;
    _password = password;
  }

  // Define métodos get e set para cada atributo, usando o operador ?? para tratar valores nulos, se for o caso é passado o valor 0, ou String vazia

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

  // Método factory que recebe um mapa JSON e retorna uma nova instância de UsuarioModelo
  factory UsuarioModelo.fromJson(Map<String, dynamic> json,
      {bool useUtf8 = true}) {
    return UsuarioModelo(
        id: json[
            'id'], // Atribui o valor do campo "id" do JSON ao parâmetro "id" do construtor
        email: json[
            'email'], // Atribui o valor do campo "email" do JSON ao parâmetro "email" do construtor
        password: json[
            'password'], // Atribui o valor do campo "password" do JSON ao parâmetro "password" do construtor
        nomeUsuario:
            !useUtf8 // Usa a condição !useUtf8 para verificar se precisa decodificar o nome do usuario em UTF-8
                ? json[
                    'nome_usuario'] // Atribui o valor do campo "nome_usuario" do JSON ao parâmetro "nomeUsuario" do construtor
                : json['nome_usuario'] != null
                    ? utf8.decode(json['nome_usuario']
                        .toString()
                        .codeUnits) // Decodifica o valor do campo "nome_usuario" do JSON de UTF-8 para String, se estiver presente
                    : ''); // Atribui uma string vazia ao parâmetro "nomeUsuario" do construtor se o campo "nome_usuario" for nulo no JSON
  }

  // Método que retorna o objeto transformado em json(String)
  toJson() {
    return jsonEncode({
      'id': id, // Converte o valor do atributo "id" para JSON
      'email': email, // Converte o valor do atributo "email" para JSON
      'password': password, // Converte o valor do atributo "password" para JSON
      'nome_usuario':
          nomeUsuario, // Converte o valor do atributo "nomeUsuario" para JSON
    });
  }
}
