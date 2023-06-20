import 'dart:convert';

class ProdutoModelo {
  int? _id;
  String? _nomeProduto;
  String? _precoProduto;
  String? _medidaProduto;

  ProdutoModelo({
    id,
    nomeProduto,
    precoProduto,
    medidaProduto,
  }) {
    _id = id;
    _precoProduto = precoProduto;
    _nomeProduto = nomeProduto;
    _medidaProduto = medidaProduto;
  }

  // Método get e set de id
  int get id => _id ?? 0;
  set id(int? valor) {
    _id = valor ?? 0;
  }

  // Método get e set de nome
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? valor) {
    _nomeProduto = valor ?? '';
  }

  // Método get e set de email
  String get precoProduto => _precoProduto ?? " 0.0";
  set email(String? valor) {
    _precoProduto = valor ?? "0.0";
  }

  // Método get e set de medidaProduto
  String get medidaProduto => _medidaProduto ?? "0.0";
  set medidaProduto(String? valor) {
    _medidaProduto = valor ?? "0.0";
  }

  // Método que pegar um json(Map) e retorna um novo objeto de UsuárioModelo
  factory ProdutoModelo.fromJson(Map<String, dynamic> json,
      {bool useUtf8 = true}) {
    return ProdutoModelo(
        id: json['id'],
        medidaProduto: json['medida_produto'],
        precoProduto: json['preco_produto'],
        nomeProduto: !useUtf8
            ? json['nome_produto']
            : json['nome_produto'] != null
                ? utf8.decode(json['nome_produto'].toString().codeUnits)
                : '');
  }

  // Método que retorna o objeto transformado em json(String)
  toJson() {
    return jsonEncode({
      'id': id,
      'nome_produto': nomeProduto,
      'preco_produto': double.parse(precoProduto),
      'medida_produto': double.parse(medidaProduto),
    });
  }
}
