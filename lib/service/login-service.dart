// Importando as bibliotecas necessárias
import 'dart:convert';
import 'dart:developer';
import 'package:comparador/controller/login-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart' as http;

class LoginService {
  final LoginController _loginControlador =
      getx.Get.find<LoginController>(); // Instanciando o controlador de login

  final String baseUrl =
      '${dotenv.env['baseURL']}'; // Definindo a URL base da API
  final String modulo =
      'api/token/'; // Definindo o módulo de autenticação da API

  // Função para autenticar o usuário
  Future logarUsuario(BuildContext context) async {
    // Definição dos cabeçalhos da requisição HTTP
    Map<String, String> requestHeaders = {
      'Content-type':
          'application/json', // Definindo o tipo de conteúdo da requisição
      'Accept':
          'application/json' // Definindo o tipo de conteúdo aceito pela requisição
    };
    print(baseUrl + modulo); // Imprimindo a URL completa da requisição
    try {
      var response = await http.post(
          Uri.parse(
              '$baseUrl$modulo'), // Fazendo uma requisição POST para a API
          body: jsonEncode({
            // Convertendo os dados do usuário em JSON
            'email': _loginControlador.email.value.text
                .toLowerCase(), // Pegando o email do controlador e colocando em minúsculo
            'password': _loginControlador
                .password.value.text // Pegando a senha do controlador
          }),
          headers: requestHeaders);

      // Se a resposta for bem sucedida (código 200)
      if (response.statusCode == 200) {
        _loginControlador.decodificandoToken(
            response); // Decodificando o token recebido pela resposta
        log(response.body.toString()); // Registrando o corpo da resposta

        // Redirecionar o usuário para as respectivas rotas

        if (context.mounted) {
          // Se o contexto ainda estiver montado
          Navigator.of(context).pushReplacementNamed(
              '/menu'); //O usuário será navegado para o menu
        }
      }
    } catch (error) {
      // Se ocorrer algum erro na requisição
      return Future.error(
          error); // Retorna um erro futuro com a mensagem do erro
    }
  }
}
