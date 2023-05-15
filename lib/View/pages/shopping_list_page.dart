import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranger_todolist/ViewModel/controllers/shopping_list_controller.dart';

import '../../ViewModel/controllers/task_controller.dart';

class ShoppingPage extends StatelessWidget {
  final ShoppingListController _shoppingListController = Get.put(ShoppingListController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: _shoppingListController.shoppingList.length,
          itemBuilder: (_, index) {
            return Card(
              child: ListTile(
                title: Text(_shoppingListController.shoppingList[index].title),
                trailing: Wrap(
                  spacing: 12, // espaço entre os botões
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _textEditingController.text =
                            _shoppingListController.shoppingList[index].title;
                        _displayEditDialog(context, index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _shoppingListController.deleteItem(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _textEditingController
              .clear(); // Limpa o campo antes de abrir o diálogo para adicionar nova tarefa
          _displayAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _displayAddDialog(BuildContext context) {
    _displayDialog(context, 'Adicione um item para lembrar de comprar', (title) {
      _shoppingListController.addItem(title);
    });
  }

  void _displayEditDialog(BuildContext context, int index) {
    _displayDialog(context, 'Edite a tarefa', (title) {
      _shoppingListController.updateItem(index, title);
    });
  }

  void _displayDialog(
      BuildContext context, String title, Function(String) onSubmit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Digite aqui"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('CANCELAR'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('ADICIONAR'),
              onPressed: () {
                onSubmit(_textEditingController.text);
                _textEditingController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
