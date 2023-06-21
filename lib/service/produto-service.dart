import 'dart:convert';
import 'package:comparador/controller/login-controller.dart';
import 'package:comparador/controller/produto-controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/produto-modelo.dart';

// Service Responsável pelo CRUD de Produtos
class CrudProdutoService {
  // Inicializando os controladores
  final ProdutoController _produtoController = Get.find<ProdutoController>();
  final LoginController _loginController = Get.find<LoginController>();

  // BaseURL e o módulo do service
  final String baseUrl = '${dotenv.env['baseURL']}';
  final String modulo = 'listacompras/';

  // Método responsável pela adição de um novo Produto
  Future<ProdutoModelo> adicionarProduto(
      {required String nome_produto,
      required double preco_produto,
      required double medida_produto}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${_loginController.token.value}'
    };
    try {
      var response = await http.post(Uri.parse('$baseUrl${modulo}cadastrar/'),

          // Nova empresa que será cadastrado
          body: jsonEncode({
            "nome_produto": nome_produto,
            "preco_produto": preco_produto,
            "medida_produto": medida_produto
          }),
          headers: requestHeaders);

      // Quando terminar a requisição atualizar a variável

      // Se a requisição estiver com código de 200 ou 201 vamos limpar o
      // dadosFinaisDoFormulário
      if (response.statusCode == 201 || response.statusCode == 200) {
        _produtoController.produtoDados.value = ProdutoModelo();
        return ProdutoModelo.fromJson(jsonDecode(response.body));

        // Se não vamos mostrar o erro para o usuário
      } else {
        return Future.error(response.body);
      }

      // Caso dê um erro na requisição e não seja possivel completa-la
      // vamos falar para o usuário que ele está desconectado com o servidor
    } catch (erro) {
      return Future.error(erro);
    }
  }

  // Método responsável pela listagem das Produtos
  Future<String> listarProdutos({bool usarControlador = true}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${_loginController.token.value}'
    };
    try {
      // Em alguns casos a aplicação quebra se mudar o valor do controler mais de uma vez antes de renderizar
      if (usarControlador) {}

      // Requisição em si
      var response =
          await http.get(Uri.parse('$baseUrl$modulo'), headers: requestHeaders);

      // Se der 200 vamos guardar a resposta em uma lista de Produtos
      if (response.statusCode == 200) {
        _produtoController.guardarProduto(response.body);
        return response.body;

        // Retornando o status para funcinar no Future Builder
      } else {
        return response.statusCode.toString();
      }

      // Caso dê um erro na requisição e não seja possivel completa-la
      // vamos falar para o usuário que ele está desconectado com o servidor
      // e retorna o erro
    } catch (erro) {
      return Future.error(erro);
    }
  }

  Future<String> detalharProdutos(int id) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${_loginController.token.value}'
    };
    try {
      // Em alguns casos a aplicação quebra se mudar o valor do controler mais de uma vez antes de renderizar

      // Requisição em si
      var response = await http.get(Uri.parse('$baseUrl${modulo}$id'),
          headers: requestHeaders);

      // Se der 200 vamos guardar a resposta em uma lista de Produtos
      if (response.statusCode == 200) {
        _produtoController.produtoDados.value = jsonDecode(response.body);
        return response.body;

        // Retornando o status para funcinar no Future Builder
      } else {
        return response.statusCode.toString();
      }

      // Caso dê um erro na requisição e não seja possivel completa-la
      // vamos falar para o usuário que ele está desconectado com o servidor
      // e retorna o erro
    } catch (erro) {
      return Future.error(erro);
    }
  }

  // Método responsável pela edição de um Produto
  Future<ProdutoModelo> atualizarProduto(
      {required int id,
      required String nome_produto,
      required String preco_produto,
      required String medida_produto}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${_loginController.token.value}'
    };
    try {
      var response =
          await http.patch(Uri.parse('$baseUrl${modulo}atualizar/$id/'),
              body: jsonEncode({
                "id": id,
                "nome_produto": nome_produto,
                "preco_produto": preco_produto,
                "medida_produto": medida_produto
              }),
              headers: requestHeaders);

      // Se a requisição estiver com código de 200 ou 201 vamos limpar o
      // dadosFinaisDoFormulário
      if (response.statusCode == 201 || response.statusCode == 200) {
        _produtoController.produtoDados.value = ProdutoModelo();

        return ProdutoModelo.fromJson(jsonDecode(response.body));

        // Se não vamos mostrar o erro para o usuário
      } else {
        return Future.error(response.body);
      }

      // Caso dê um erro na requisição e não seja possivel completa-la
      // vamos falar para o usuário que ele está desconectado com o servidor
    } catch (erro) {
      return Future.error(erro);
    }
  }

  // Método responsável por deletar um Produto
  Future<String> deletarProduto(int id) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '${_loginController.token.value}'
    };
    try {
      // Mudando a variável observada indicando que uma requisição está em andamento

      var response = await http.delete(
          Uri.parse('$baseUrl${modulo}deletar/$id/'),
          headers: requestHeaders);

      // Caso dê 200 só retorna o body
      if (response.statusCode >= 200) {
        return response.body;

        // Se não retorna um erro
      } else {
        return Future.error(response.body);
      }

      // Caso dê um erro na requisição e não seja possivel completa-la
      // vamos falar para o usuário que ele está desconectado com o servidor
      // depois retorna o erro
    } catch (e) {
      return Future.error(e);
    }
  }
}
