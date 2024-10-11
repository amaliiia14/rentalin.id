import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/detail_booking/controllers/detail_booking_controller.dart';

class DetailBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBookingController>(() => DetailBookingController());
  }
}
