import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranger_todolist/View/pages/task_page.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: TaskPage(),
  ));
}