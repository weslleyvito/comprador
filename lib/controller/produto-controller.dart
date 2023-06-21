//Importando as bibliotecas necessárias
import 'dart:convert';
import 'package:get/get.dart';

import '../models/produto-modelo.dart';

//Criando uma classe ProdutoController que herda de GetxController
class ProdutoController extends GetxController {
  // Criando uma variável reativa do tipo ProdutoModelo para armazenar os dados de um produto
  // Essas variável pode ser observada e atualizada pelo GetX
  final Rx<ProdutoModelo> produtoDados = ProdutoModelo().obs;

  // Criando uma lista reativa de ProdutoModelo para armazenar os produtos
  final RxList<ProdutoModelo> produtos = <ProdutoModelo>[].obs;

  // Criando uma variável reativa do tipo ProdutoModelo para armazenar os detalhes de um produto
  late final Rx<ProdutoModelo> produtoDetalhar = ProdutoModelo().obs;

  /// Método que guarda todos os planos na lista planos
  guardarProduto(String body) {
    // Limpa os planos para não ter riscos de duplicar a lista
    produtos.clear();

    // Transformando o corpo da requisição(json string) em um objeto json(Map)
    var jsonPlanos = jsonDecode(body);

    // Passando por cada elemento do objeto criado acima
    for (Map<String, dynamic> jsonPlano in jsonPlanos) {
      // Encapsulando o elemento atual em um modelo de PlanoModel
      ProdutoModelo produto = ProdutoModelo.fromJson(jsonPlano);

      // Adicionando o novo objeto do modelo PlanoModel na lista de produto
      produtos.add(produto);
    }
  }
}
