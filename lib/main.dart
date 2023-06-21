//Importando as bibliotecas necessárias
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

// Definindo a função principal que é executada ao iniciar o aplicativo
void main() async {
  // Carregando as variáveis de ambiente de um arquivo .env
  await dotenv.load(fileName: ".env");

  // Garantindo que a inicialização do Flutter seja feita antes de executar o aplicativo
  WidgetsFlutterBinding.ensureInitialized();

  // Colocando as instâncias dos controladores no GetX para gerenciar o estado e a dependência
  Get.put(Controlador());
  Get.put(UsuarioController());
  Get.put(LoginController());
  Get.put(ProdutoController());

  // Executando o widget MyApp como a raiz do aplicativo
  runApp(const MyApp());
}

// Definindo uma classe chamada MyApp que é uma subclasse de StatelessWidget
class MyApp extends StatelessWidget {
  //Contrutor recebe o parâmetro key para identificar um widget de forma única
  const MyApp({Key? key}) : super(key: key);

  // Definindo um método que constrói o widget do aplicativo
  @override
  Widget build(BuildContext context) {
    // Retornando um widget MaterialApp que fornece a configuração básica do aplicativo
    return MaterialApp(
      // Definindo o título do aplicativo
      title: 'Flutter Demo',

      // Desabilitando o banner de debug na tela
      debugShowCheckedModeBanner: false,

      // Definindo o tema do aplicativo como um tema personalizado
      theme: Tema.meuTema,

      // Definindo a página inicial do aplicativo como uma página de comparação de produtos
      home: const PageComparateProdute(),

      // Definindo a rota inicial do aplicativo como a rota de login
      initialRoute: '/login',

      // Definindo as rotas nomeadas do aplicativo e seus respectivos widgets
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
