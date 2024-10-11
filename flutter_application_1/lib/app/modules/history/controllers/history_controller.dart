import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/history/data/history_data.dart';

class HistoryController extends GetxController {
  var historyItems = HistoryData.historyItems.obs;
}
