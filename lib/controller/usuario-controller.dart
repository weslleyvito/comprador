//Importando as bibliotecas necessárias
import 'dart:convert';

import 'package:comparador/models/usuario-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Criando uma classe UsuarioController que herda de GetxController
class UsuarioController extends GetxController {
  //Criando um controlador de texto reativo para o campo de email
  final Rx<TextEditingController> email = TextEditingController().obs;

  //Criando um controlador de texto reativo para o campo de senha
  final Rx<TextEditingController> password = TextEditingController().obs;

  //Criando um modelo de usuário reativo para armazenar os dados do usuário atual
  final Rx<UsuarioModelo> usuarioDados = UsuarioModelo().obs;

  //Criando uma lista reativa de modelos de usuário para armazenar os dados dos usuários cadastrados
  final RxList<UsuarioModelo> usuarios = <UsuarioModelo>[].obs;

  /// Método que guarda todos os planos na lista planos
  guardarUsuario(String body) {
    // Limpa os planos para não ter riscos de duplicar a lista
    usuarios.clear();

    // Transformando o corpo da requisição(json string) em um objeto json(Map)
    var jsonPlanos = jsonDecode(body);

    // Passando por cada elemento do objeto criado acima
    for (Map<String, dynamic> jsonPlano in jsonPlanos) {
      // Encapsulando o elemento atual em um modelo de PlanoModel
      UsuarioModelo usuario = UsuarioModelo.fromJson(jsonPlano);

      // Adicionando o novo objeto do modelo PlanoModel na lista deusuario
      usuarios.add(usuario);
    }
  }
}
