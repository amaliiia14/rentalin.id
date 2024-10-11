import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/history/controllers/history_controller.dart';

class HistoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
