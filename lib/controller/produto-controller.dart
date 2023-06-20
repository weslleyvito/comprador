import 'dart:convert';
import 'package:get/get.dart';

import '../models/produto-modelo.dart';

class ProdutoController extends GetxController {
  final Rx<ProdutoModelo> produtoDados = ProdutoModelo().obs;
  final RxList<ProdutoModelo> produtos = <ProdutoModelo>[].obs;
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
