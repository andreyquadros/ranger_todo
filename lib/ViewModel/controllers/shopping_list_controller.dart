import 'package:get/get.dart';
import '../../Model/models/task.dart';

class ShoppingListController extends GetxController {
  // Criando uma lista reativa de tasks
  var shoppingList = <Task>[].obs;

  void addItem(String title) {
    shoppingList.add(Task(title));
  }

  void deleteItem(int index) {
    shoppingList.removeAt(index);
  }

  void updateItem(int index, String title) {
    var editingItem = shoppingList[index];
    editingItem.title = title;
    shoppingList[index] = editingItem;
  }
}
