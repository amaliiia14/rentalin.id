import 'package:get/get.dart';

class CalendarController extends GetxController {
 
  var selectedDate = 18.obs;  

  void updateSelectedDate(int date) {
    selectedDate.value = date;
  }
}
