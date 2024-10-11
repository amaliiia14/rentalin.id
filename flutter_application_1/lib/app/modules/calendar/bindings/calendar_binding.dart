import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/calendar/controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarController>(() => CalendarController());
  }
}