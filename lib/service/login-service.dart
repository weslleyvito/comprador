import 'dart:convert';
import 'dart:developer';
import 'package:comparador/controller/login-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart' as http;

class LoginService {
  final LoginController _loginControlador = getx.Get.find<LoginController>();

  final String baseUrl = '${dotenv.env['baseURL']}';
  final String modulo = 'api/token/';

  // Função para autenticar o usuário
  Future logarUsuario(BuildContext context) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    print(baseUrl + modulo);
    try {
      var response = await http.post(Uri.parse('$baseUrl$modulo'),
          body: jsonEncode({
            'email': _loginControlador.email.value.text.toLowerCase(),
            'password': _loginControlador.password.value.text
          }),
          headers: requestHeaders);

      if (response.statusCode == 200) {
        _loginControlador.decodificandoToken(response);
        log(response.body.toString());

        // Redirecionar o usuário para as respectivas rotas
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/menu');
        }
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
