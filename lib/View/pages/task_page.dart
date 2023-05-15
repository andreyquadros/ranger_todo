import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ViewModel/controllers/task_controller.dart';

class TaskPage extends StatelessWidget {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            return Card(
              child: ListTile(
                title: Text(_taskController.taskList[index].title),
                trailing: Wrap(
                  spacing: 12, // espaço entre os botões
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _textEditingController.text =
                            _taskController.taskList[index].title;
                        _displayEditDialog(context, index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _taskController.deleteTask(index);
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
    _displayDialog(context, 'Adicione uma tarefa', (title) {
      _taskController.addTask(title);
    });
  }

  void _displayEditDialog(BuildContext context, int index) {
    _displayDialog(context, 'Edite a tarefa', (title) {
      _taskController.updateTask(index, title);
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
              child: Text('SALVAR'),
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
