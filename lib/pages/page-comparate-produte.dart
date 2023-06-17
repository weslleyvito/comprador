import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/input-generics.dart';
import '../controller/controller.dart';

class PageComparateProdute extends StatefulWidget {
  const PageComparateProdute({Key? key}) : super(key: key);

  @override
  State<PageComparateProdute> createState() => _PageComparateProduteState();
}

class _PageComparateProduteState extends State<PageComparateProdute> {
  final Controlador _controlador = Get.find<Controlador>();

  // Função que calcula o preço por quilo de um produto
  precoPorQuilo(var peso, var preco) {
    return preco / peso;
  }

  // Função que compara dois produtos e retorna qual é mais barato
  compararProdutos(var peso1, var preco1, var peso2, var preco2) {
    var ppq1 = precoPorQuilo(peso1, preco1); // Preço por quilo do produto 1
    var ppq2 = precoPorQuilo(peso2, preco2); // Preço por quilo do produto 2
    if (ppq1 < ppq2) {
      _controlador.mensagem.value =
          "O produto 1 está mais em conta, pois custa R\$ $ppq1 por quilo.";
      return _controlador.mensagem.value;
    } else if (ppq1 > ppq2) {
      _controlador.mensagem.value =
          "O produto 2 está mais em conta, pois custa R\$ $ppq2 por quilo.";
      return _controlador.mensagem.value;
    } else {
      _controlador.mensagem.value =
          "Os dois produtos têm o mesmo preço por quilo: R\$ $ppq1.";
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
              InputGeneric(
                label: 'Peso 1 (kg)',
                controller: peso1,
                typeInput: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty || value == null) {
                    return "Campo Obrigatorio";
                  }
                  return null;
                },
                errorText: "Peso não informado!",
              ),
              InputGeneric(
                label: 'Preço 1 (R\$)',
                controller: preco1,
                typeInput: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty || value == null) {
                    return "Campo Obrigatorio";
                  }
                  return null;
                },
                errorText: "Peso não informado!",
              ),
              InputGeneric(
                label: 'Peso 2 (kg)',
                controller: peso2,
                typeInput: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty || value == null) {
                    return "Campo Obrigatorio";
                  }
                  return null;
                },
                errorText: "Peso não informado!",
              ),
              InputGeneric(
                label: 'Preço 2 (R\$)',
                controller: preco2,
                typeInput: TextInputType.number,
                validator: (String? value) {
                  if (value!.isEmpty || value == null) {
                    return "Campo Obrigatorio";
                  }
                  return null;
                },
                errorText: "Peso não informado!",
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  compararProdutos(
                      double.parse(peso1.text),
                      double.parse(preco1.text),
                      double.parse(peso2.text),
                      double.parse(preco2.text));
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
