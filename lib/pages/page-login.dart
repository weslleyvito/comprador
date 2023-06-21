//Importando bibliotecas necessárias
import 'package:comparador/service/login-service.dart';
import 'package:comparador/util/tema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// import '../components/input-generics.dart';
import '../controller/login-controller.dart';

//Definindo classe LoginPage que herda de StatefulWidget
class LoginPage extends StatefulWidget {
  //Contrutor recebe o parâmetro key para identificar um widget de forma única
  const LoginPage({Key? key}) : super(key: key);

  //Definindo o método createState que retorna _LoginPageState
  @override
  State<LoginPage> createState() => _LoginPageState();
}

//Definindo uma classe do chamada _LoginPageState que é uma subclasse de LoginPage
class _LoginPageState extends State<LoginPage> {
  //Criando uma instância do LoginController usando o GetX LoginController
  LoginController _loginController = Get.find<LoginController>();

  //Criando uma variável booleana para controlar a visibilidade da senha
  bool _obscured = true;

  // Definindo um método que constrói o widget da tela de login
  @override
  Widget build(BuildContext context) {
    // Retornando um widget Scaffold que fornece a estrutura básica da tela
    return Scaffold(

        // Definindo a cor de fundo da tela como um tom de laranja
        backgroundColor: Colors.deepOrangeAccent.shade400,

        // Definindo o corpo da tela como uma pilha de widgets
        body: Stack(
          children: [
            // Container(color: Colors.blue, height: MediaQuery.of(context).size.height*0.6),
            Center(
              // Definindo um widget Column que organiza os widgets filhos verticalmente
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adicionando um espaçamento em torno do widget filho
                    Padding(
                      padding: const EdgeInsets.all(30),

                      // Definindo um widget Image que carrega uma imagem de um asset local
                      child: Image.asset(
                        'img/logo_comparador.png',
                        width: 250,
                        height: 250,
                      ),
                    ),

                    // Definindo um widget Form que valida e salva os dados de entrada
                    Form(

                        // Definindo um widget Column que organiza os widgets filhos verticalmente
                        child: Column(
                      // Alinhando os widgets filhos à esquerda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Adicionando um espaçamento em torno do widget filho
                        Padding(
                          padding: const EdgeInsets.all(20),

                          // Definindo um widget TextFormField que permite a entrada de texto
                          child: TextFormField(
                            // Definindo a decoração do campo de texto
                            decoration: const InputDecoration(
                              // Definindo o texto do rótulo do campo
                              labelText: "Email",

                              // Definindo a borda do campo como arredondada
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,

                              // Preenchendo o campo com uma cor cinza clara
                              fillColor: Color(0xFFEEEEEE),

                              // Adicionando um espaçamento interno ao campo
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                            ),

                            // Associando o controlador de texto reativo do email ao campo
                            controller: _loginController.email.value,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            obscureText: _obscured,
                            decoration: InputDecoration(
                              labelText: "Senha",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Color(0xFFEEEEEE),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscured = !_obscured;
                                  });
                                },
                                icon: Icon(
                                  _obscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            controller: _loginController.password.value,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () async {
                                await LoginService().logarUsuario(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Tema.corPrimaria, // Cor de fundo do botão
                                onPrimary:
                                    Colors.white, // Cor do texto do botão
                                padding: EdgeInsets.all(
                                    16), // Espaçamento interno do botão
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Borda arredondada do botão
                                  side: BorderSide(
                                    color: Tema.corPrimaria, // Cor da borda
                                    width: 2, // Largura da borda
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.login),
                                  Text(
                                    'Entrar',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              )),
                        )
                      ],
                    )),
                  ]),
            )
          ],
        ));
  }
}
