// Importando os pacotes necessários para usar os widgets do flutter
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
//Definindo uma classe InputGeneric do tipo Stateful que pode mudar ao longo do tempo

class InputGeneric extends StatefulWidget {
  //Declara os atributos da classe que serão incializados mais tarde com o late
  late String label;
  late TextEditingController controller;
  late TextInputType typeInput;
  late String? Function(String?)? validator;
  late String Function(String?) onChange;
  late String errorText;

  // Definindo o construtor da classe, recebendo os atributos como parâmetros, required mostra que o campo é obrigatório
  InputGeneric({
    Key? key,
    required this.label,
    required this.controller,
    required this.typeInput,
    // required this.validator,
    // required this.onChange,
    // required this.errorText,
  }) : super(key: key);

  //Definindo o método createState que retorna _InputGenericState
  @override
  State<InputGeneric> createState() => _InputGenericState();
}

//Definindo uma classe do chamada _InputGenericState que é uma subclasse de InputGeneric
class _InputGenericState extends State<InputGeneric> {
  //Definindo o método quando o widget inserido pela primeira vez na árvore de widgets
  @override
  void initState() {
    super.initState(); //Chama o método da superclasse
    widget.controller =
        TextEditingController(); // Inicializa o controlador do widget com um novo objeto TextEditingController
  }

  //Definindo o método quando o widget inserido pela primeira vez na árvore de widgets
  @override
  void dispose() {
    widget.controller
        .dispose(); // Descarta o controlador do widget para liberar recursos e evitar vazamentos de memória
    super.dispose(); // Chama o método da superclasse
  }

  // Definindo o método que é chamado quando o usuário termina de editar o texto no campo de entrada
  void _validateInput(String value) {
    setState(() {
      // Atualiza o estado do widget com a nova informação
      widget.errorText = widget.validator!(value) ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.typeInput,
      decoration: InputDecoration(
        labelText: widget.label,
        //  errorText: widget.errorText
      ),
      // validator: widget.validator,
      onEditingComplete: () => _validateInput(widget.controller.text),
      // onChanged: widget.onChange,
    );
  }
}
