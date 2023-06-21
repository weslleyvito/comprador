//Importando as bibliotecas necessárias
import 'package:comparador/service/produto-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';

//Definindo classe PageComparateProdute que herda de StatefulWidget
class PageComparateProdute extends StatefulWidget {
  //Contrutor recebe o parâmetro key para identificar um widget de forma única
  const PageComparateProdute({Key? key}) : super(key: key);

  //Definindo o método createState que retorna _PageComparateProduteState
  @override
  State<PageComparateProdute> createState() => _PageComparateProduteState();
}

//Definindo uma classe do chamada _PageComparateProduteState que é uma subclasse de PageComparateProdute
class _PageComparateProduteState extends State<PageComparateProdute> {
  final Controlador _controlador = Get.find<Controlador>();

  // Função que calcula o preço por quilo de um produto
  precoPorQuilo(var peso, var preco) {
    return preco / peso;
  }

  // Função que compara dois produtos e retorna qual é mais barato
  compararProdutos(
    String nome1,
    String nome2,
    var peso1,
    var preco1,
    var peso2,
    var preco2,
  ) {
    var ppq1 = precoPorQuilo(peso1, preco1); // Preço por quilo do produto 1
    var ppq2 = precoPorQuilo(peso2, preco2); // Preço por quilo do produto 2
    if (ppq1 < ppq2) {
      CrudProdutoService().adicionarProduto(
          nome_produto: nome1, preco_produto: preco1, medida_produto: peso1);
      _controlador.mensagem.value =
          "O produto 1 está mais em conta, pois custa R\$ $ppq1 por quilo.";
      return _controlador.mensagem.value;
    } else if (ppq1 > ppq2) {
      CrudProdutoService().adicionarProduto(
          nome_produto: nome2, preco_produto: preco2, medida_produto: peso2);
      _controlador.mensagem.value =
          "O produto 2 está mais em conta, pois custa R\$ $ppq2 por quilo.";
      return _controlador.mensagem.value;
    } else {
      CrudProdutoService().adicionarProduto(
          nome_produto: nome1, preco_produto: preco1, medida_produto: peso1);
      _controlador.mensagem.value =
          "Os dois produtos têm o mesmo preço por quilo: R\$ $ppq1.";
      return _controlador.mensagem.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nome1 = TextEditingController();
    TextEditingController nome2 = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nome do Produto 1",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.text,
                  controller: nome1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Peso 1 (kg)",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.number,
                  controller: peso1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Preço 1 (R\$)",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.number,
                  controller: preco1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nome do Produto 2",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.text,
                  controller: nome2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Peso 2 (kg)",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.number,
                  controller: peso2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Preço 2 (R\$)",
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: Color(0xFFEEEEEE),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                  keyboardType: TextInputType.number,
                  controller: preco2,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        double peso1Value, preco1Value, peso2Value, preco2Value;
                        try {
                          peso1Value = double.parse(peso1.text);
                          preco1Value = double.parse(preco1.text);
                          peso2Value = double.parse(peso2.text);
                          preco2Value = double.parse(preco2.text);
                          compararProdutos(nome1.text, nome2.text, peso1Value,
                              preco1Value, peso2Value, preco2Value);
                        } catch (e) {
                          print('Error parsing input values: $e');
                          // Handle the error accordingly (e.g., show an error message to the user)
                        }
                      },
                      child: const Text('Comparar'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/menu');
                      },
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
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
