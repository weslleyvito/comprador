import 'dart:convert';

import 'package:comparador/controller/usuario-controller.dart';
import 'package:comparador/models/usuario-model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Service Responsável pelo CRUD de Usuarios
class CrudUsuarioService {
  // Inicializando os controladores
  final UsuarioController _usuarioController = Get.find<UsuarioController>();

  // BaseURL e o módulo do service
  final String baseUrl = '${dotenv.env['baseURL']}';
  final String modulo = 'usuario/';

  // Método responsável pela adição de um novo Usuario
  Future<UsuarioModelo> adicionarUsuario() async {
    try {
      // Mudando a variável observada indicando que uma requisição está em andamento

      // Requisição em si
      var response = await http.post(Uri.parse('$baseUrl${modulo}cadastrar/'),

          // Nova empresa que será cadastrado
          body: _usuarioController.usuarioDados.value.toJson());

      // Quando terminar a requisição atualizar a variável

      // Se a requisição estiver com código de 200 ou 201 vamos limpar o
      // dadosFinaisDoFormulário
      if (response.statusCode == 201 || response.statusCode == 200) {
        _usuarioController.usuarioDados.value = UsuarioModelo();
        return UsuarioModelo.fromJson(jsonDecode(response.body));

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

  // Método responsável pela listagem das Usuarios
  Future<String> listarUsuarios({bool usarControlador = true}) async {
    try {
      // Em alguns casos a aplicação quebra se mudar o valor do controler mais de uma vez antes de renderizar
      if (usarControlador) {}

      // Requisição em si
      var response = await http.get(Uri.parse('$baseUrl$modulo'));

      // Se der 200 vamos guardar a resposta em uma lista de Usuarios
      if (response.statusCode == 200) {
        _usuarioController.guardarUsuario(response.body);
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

  // Método responsável pela edição de um Usuario
  Future<UsuarioModelo> atualizarUsuario({required int id}) async {
    try {
      // Requisição em si
      var response = await http.patch(
          Uri.parse('$baseUrl${modulo}atualizar/$id/'),
          body: _usuarioController.usuarioDados.value.toJson());

      // Se a requisição estiver com código de 200 ou 201 vamos limpar o
      // dadosFinaisDoFormulário
      if (response.statusCode == 201 || response.statusCode == 200) {
        _usuarioController.usuarioDados.value = UsuarioModelo();

        return UsuarioModelo.fromJson(jsonDecode(response.body));

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

  // Método responsável por deletar um Usuario
  Future<String> deletarUsuario(int id) async {
    try {
      // Mudando a variável observada indicando que uma requisição está em andamento

      var response =
          await http.delete(Uri.parse('$baseUrl${modulo}deletar/$id/'));

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
