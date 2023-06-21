import 'package:comparador/controller/produto-controller.dart';
import 'package:comparador/service/produto-service.dart';
import 'package:comparador/util/tema.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ProdutoController _produtoController = Get.find<ProdutoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
        future: CrudProdutoService()
            .listarProdutos(), // Função que realiza a requisição e retorna um Future<List<Informacao>>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Enquanto aguarda a resposta do back-end
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Em caso de erro na requisição
            return Text('Erro: ${snapshot.error}');
          } else {
            // Se a requisição foi bem-sucedida, você pode acessar os dados através de snapshot.data

            // Construa a interface com base nos dados recebidos
            return ListView.builder(
              itemCount: _produtoController.produtos.length,
              itemBuilder: (context, index) {
                final informacao = _produtoController.produtos[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Dismissible(
                      key: Key(informacao.id.toString()),
                      direction: DismissDirection
                          .startToEnd, // Direção do gesto de deslize
                      onDismissed: (direction) {
                        // Ação a ser executada quando o item for deslizado
                        if (direction == DismissDirection.startToEnd) {
                          // Realize a ação desejada aqui
                          CrudProdutoService().deletarProduto(informacao.id);
                        }
                      },
                      background: Container(
                        color: Colors.red, // Cor de fundo ao deslizar
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(informacao.nomeProduto),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Preço:${informacao.precoProduto} reais"),
                              Text("Medida:${informacao.medidaProduto} kg/L"),
                              IconButton(
                                  onPressed: () {
                                    CrudProdutoService()
                                        .deletarProduto(informacao.id)
                                        .then((value) => Navigator.of(context)
                                            .pushReplacementNamed('/menu'));
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                        trailing: Column(children: [
                          IconButton(
                              onPressed: () {
                                onPressedEditingButton(context, index);
                              },
                              icon: Icon(Icons.edit))
                        ]),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Tema.corPrimaria,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/cadastro-produto');
          },
          child: Icon(
            Icons.compare_arrows,
            color: Colors.white,
            size: 28,
          )),
    );
  }
}

Future<dynamic> onPressedEditingButton(BuildContext context, int index) {
  ProdutoController _produtoController = Get.find<ProdutoController>();

  TextEditingController _nomeProduto = TextEditingController(
      text: (_produtoController.produtos[index].nomeProduto));
  TextEditingController _precoProduto = TextEditingController(
      text: (_produtoController.produtos[index].precoProduto));
  TextEditingController _medidaProduto = TextEditingController(
      text: (_produtoController.produtos[index].medidaProduto));

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Editar Produto'),
        content: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
                maxWidth: MediaQuery.of(context).size.width * 0.8),
            child: Form(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Nome do Produto",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color(0xFFEEEEEE),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                      controller: _nomeProduto,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Preço do Produto",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color(0xFFEEEEEE),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                      controller: _precoProduto,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Medida do Produto",
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color(0xFFEEEEEE),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                      controller: _medidaProduto,
                    ),
                  ),
                ],
              ),
            )),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              CrudProdutoService()
                  .atualizarProduto(
                      id: _produtoController.produtos[index].id,
                      nome_produto: _nomeProduto.text,
                      preco_produto: _precoProduto.text,
                      medida_produto: _medidaProduto.text)
                  .then(
                    (value) => {
                      // CrudProdutoService().listarProdutos(),
                      Navigator.of(context).pushReplacementNamed('/menu')
                    },
                  );
            },
            child: Text('Salvar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fechar o AlertDialog
            },
            child: Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
