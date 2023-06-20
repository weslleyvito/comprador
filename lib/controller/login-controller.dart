import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController extends GetxController {
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final Rx<String> token = "".obs;
  // final Rx<int> idUsuarioLogado = 0.obs;

  Map<String, dynamic> decodificandoToken(dynamic response) {
    // Chamando os controladores necessários

    final data = jsonDecode(response.body);

    token.value = data['access'];

    Map<String, dynamic> tokenDecodificado = JwtDecoder.decode(token.value);

    return tokenDecodificado;
  }
}
