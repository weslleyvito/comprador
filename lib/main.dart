import 'package:comparador/controller/controller.dart';
import 'package:comparador/controller/login-controller.dart';
import 'package:comparador/controller/produto-controller.dart';
import 'package:comparador/controller/usuario-controller.dart';
import 'package:comparador/pages/menu.dart';
import 'package:comparador/pages/page-comparate-produte.dart';
import 'package:comparador/pages/page-login.dart';
import 'package:comparador/util/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Controlador());
  Get.put(UsuarioController());
  Get.put(LoginController());
  Get.put(ProdutoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Tema.meuTema,
      home: const PageComparateProdute(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/menu': (context) => MenuPage(),
        '/cadastro-produto': (context) => PageComparateProdute(),
        // '/futebol': (context) => Palavras(tema: 'futebol'),
        // '/comida': (context) => Palavras(tema: 'comida'),
        // '/agricultura': (context) => Palavras(tema: 'agricultura'),
        // '/animais': (context) => Palavras(tema: 'animais'),
      },
    );
  }
}
