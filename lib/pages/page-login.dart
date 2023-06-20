import 'package:comparador/service/login-service.dart';
import 'package:comparador/util/tema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// import '../components/input-generics.dart';
import '../controller/login-controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _loginController = Get.find<LoginController>();
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        body: Stack(
          children: [
            // Container(color: Colors.blue, height: MediaQuery.of(context).size.height*0.6),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset(
                        'img/logo_comparador.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              filled: true,
                              fillColor: Color(0xFFEEEEEE),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                            ),
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
                              child: const Row(
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
