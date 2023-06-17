import 'package:comparador/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  Get.put(Controlador());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Comparador de Produtos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final Controlador _controlador = Get.find<Controlador>();

  // Função que calcula o preço por quilo de um produto
  precoPorQuilo(var peso, var preco) {
    return preco / peso;
  }

  // Função que compara dois produtos e retorna qual é mais barato
   compararProdutos(
      var peso1, var preco1, var peso2, var preco2) {
    var ppq1 = precoPorQuilo(peso1, preco1); // Preço por quilo do produto 1
    var ppq2 = precoPorQuilo(peso2, preco2); // Preço por quilo do produto 2
    if (ppq1 < ppq2) {
      _controlador.mensagem.value = "O produto 1 está mais em conta, pois custa R\$ $ppq1 por quilo.";
      return _controlador.mensagem.value;
    } else if (ppq1 > ppq2) {
      _controlador.mensagem.value = "O produto 2 está mais em conta, pois custa R\$ $ppq2 por quilo.";
      return _controlador.mensagem.value;
    } else {_controlador.mensagem.value = "Os dois produtos têm o mesmo preço por quilo: R\$ $ppq1.";
      return _controlador.mensagem.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController peso1 = TextEditingController();
    TextEditingController peso2 = TextEditingController();
    TextEditingController preco1 = TextEditingController();
    TextEditingController preco2 = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text('Comparador de Produtos'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: peso1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Peso 1 (kg)'),

              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Preço 1 (R\$)'),
                controller: preco1,

              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Peso 2 (kg)'),
                controller: peso2,

              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Preço 2 (R\$)'),
                controller: preco2,

              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                
                      compararProdutos(double.parse(peso1.text), double.parse(preco1.text), double.parse(peso2.text), double.parse(preco2.text));
                },
                child: Text('Comparar'),
              ),
              Obx(() => Text(
                    _controlador.mensagem.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
