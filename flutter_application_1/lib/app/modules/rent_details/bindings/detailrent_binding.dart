import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/rent_details/controllers/detailrent_controller.dart';

class RentBinding extends Bindings {
  @override
  void dependencies() {
    // RentController akan diinisialisasi saat layar dibuka
    Get.lazyPut<RentController>(() => RentController());
  }
}
