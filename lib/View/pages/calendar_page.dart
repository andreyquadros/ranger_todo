import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ViewModel/controllers/calendar_controller.dart';

class CalendarPage extends StatelessWidget {
  final CalendarController _calendarController = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Center(
        child: Text(
          'Data atual: ${_calendarController.currentDate.value}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
