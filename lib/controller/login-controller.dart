//Importando as bibliotecas necessárias
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// Criando uma classe chamada LoginController que herda de GetxController
class LoginController extends GetxController {
  // Criando variáveis reativas do tipo TextEditingController para armazenar o email e a senha do usuário
  // Essas variáveis podem ser observadas e atualizadas pelo GetXfinal Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  // Criando uma variável reativa do tipo String para armazenar o token de acesso do usuário
  final Rx<String> token = "".obs;
  // final Rx<int> idUsuarioLogado = 0.obs;

  // Criando uma função que recebe uma resposta dinâmica e retorna um mapa com os dados do token decodificado
  Map<String, dynamic> decodificandoToken(dynamic response) {
    // Convertendo o corpo da resposta em um mapa de dados
    final data = jsonDecode(response.body);

    // Atribuindo o valor do campo 'access' do mapa de dados à variável token
    token.value = data['access'];

    // Decodificando o token usando a função decode do pacote jwt_decoder
    Map<String, dynamic> tokenDecodificado = JwtDecoder.decode(token.value);

    // Retornando o mapa com os dados do token decodificado
    return tokenDecodificado;
  }
}
