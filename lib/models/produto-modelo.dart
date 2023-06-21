// Importa a biblioteca dart:convert para usar o jsonEncode e o jsonDecode
import 'dart:convert';

// Define uma classe para modelar os dados de um produto
class ProdutoModelo {
  // Declarando quatro variáveis privadas para armazenar os atributos do produto
  int? _id;
  String? _nomeProduto;
  String? _precoProduto;
  String? _medidaProduto;

  // Define um construtor que recebe os valores dos atributos como parâmetros opcionais
  ProdutoModelo({
    id,
    nomeProduto,
    precoProduto,
    medidaProduto,
  }) {
    // Atribuindo os valores dos parâmetros às variáveis privadas, se algum parâmetro for nulo, o atributo recebe um valor padrão
    _id = id;
    _precoProduto = precoProduto;
    _nomeProduto = nomeProduto;
    _medidaProduto = medidaProduto;
  }

  // Define métodos get e set para cada atributo, usando o operador ?? para tratar valores nulos, se for o caso é passado o valor 0, ou String vazia

  // Método get e set de id
  int get id => _id ?? 0;
  set id(int? valor) {
    _id = valor ?? 0;
  }

  // Método get e set de nome do produto
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? valor) {
    _nomeProduto = valor ?? '';
  }

  // Método get e set de preço do produto
  String get precoProduto => _precoProduto ?? " 0.0";
  set precoProduto(String? valor) {
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
        id: json[
            'id'], // Atribui o valor do campo "id" do JSON ao parâmetro "id" do construtor
        medidaProduto: json[
            'medida_produto'], // Atribui o valor do campo "medida_produto" do JSON ao parâmetro "medidaProduto" do construtor
        precoProduto: json[
            'preco_produto'], // Atribui o valor do campo "preco_produto" do JSON ao parâmetro "precoProduto" do construtor
        nomeProduto:
            !useUtf8 // Usa a condição !useUtf8 para verificar se precisa decodificar o nome do produto em UTF-8
                ? json[
                    'nome_produto'] // Atribui o valor do campo "nome_produto" do JSON ao parâmetro "nomeProduto" do construtor
                : json['nome_produto'] != null
                    ? utf8.decode(json['nome_produto']
                        .toString()
                        .codeUnits) // Decodifica o valor do campo "nome_produto" do JSON de UTF-8 para String, se estiver presente
                    : ''); // Atribui uma string vazia ao parâmetro "nomeProduto" do construtor se o campo "nome_produto" for nulo no JSON
  }

  // Método que retorna o objeto transformado em json(String)
  toJson() {
    return jsonEncode({
      'id': id, // Converte o valor do atributo "id" para JSON
      'nome_produto':
          nomeProduto, // Converte o valor do atributo "nomeProduto" para JSON
      'preco_produto': double.parse(
          precoProduto), // Converte o valor do atributo "precoProduto" para JSON, convertendo-o para double antes
      'medida_produto': double.parse(
          medidaProduto), // Converte o valor do atributo "medidaProduto" para JSON, convertendo-o para double antes
    });
  }
}
