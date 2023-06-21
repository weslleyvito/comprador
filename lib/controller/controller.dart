// Importando o pacote GetX para usar o gerenciamento de estado
import 'package:get/get.dart';

// Criando uma classe chamada Controlador que herda de GetxController
class Controlador extends GetxController {
  // Criando uma variável reativa do tipo String chamada mensagem
  // Essa variável pode ser observada e atualizada pelo GetX
  final Rx<String> mensagem = ''.obs;
}
