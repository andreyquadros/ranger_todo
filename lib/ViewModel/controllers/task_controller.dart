import 'package:get/get.dart';

import '../../Model/models/task.dart';


class TaskController extends GetxController {
  // Criando uma lista reativa de tasks
  var taskList = <Task>[].obs;

  void addTask(String title) {
    taskList.add(Task(title));
  }

  void deleteTask(int index) {
    taskList.removeAt(index);
  }

  void updateTask(int index, String title) {
    var editingTask = taskList[index];
    editingTask.title = title;
    taskList[index] = editingTask;
  }
}