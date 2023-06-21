// Importando os pacotes necessários para usar os widgets do flutter
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

//Definindo uma classe ButtonGeneric do tipo Stateful que pode mudar ao longo do tempo
class ButtonGeneric extends StatefulWidget {
  //Contrutor recebe o parâmetro key para identificar um widget de forma única
  const ButtonGeneric({Key? key}) : super(key: key);

  //Propriedade onPressed vazia, usada para definir uma função quando o botão for pressionado
  get onPressed => null;

  //Definindo o método createState que retorna _ButtonGeneric
  @override
  State<ButtonGeneric> createState() => _ButtonGenericState();
}

//Definindo uma classe do chamada _ButtonGenericState que é uma subclasse de ButtonGeneric
class _ButtonGenericState extends State<ButtonGeneric> {
  //Método build que recebe o parâmetro context que é usado para acessarinformações sobre o ambiente do widget
  @override
  Widget build(BuildContext context) {
    //Método build retorna um widget do tipo ElevatedButton
    return ElevatedButton(
      //Parâmetro onPressed que recebe o valor do widget passado no ButtonGeneric, que é nulo
      onPressed: widget.onPressed,
      //Parâmetro child que recebe o valor null
      child: null,
    );
  }
}
