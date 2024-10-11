import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/history/controllers/history_controller.dart';
import 'package:flutter_application_1/app/modules/history/widgets/history_card.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFF1966FF),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'History',
            style: TextStyle(
              color: Color(0xFF1966FF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          itemCount: controller.historyItems.length,
          itemBuilder: (context, index) {
            final historyItem = controller.historyItems[index];
            return HistoryCard(
              fullName: historyItem['fullName']!,
              hometown: historyItem['hometown']!,
              phone: historyItem['phone']!,
              motorcycle: historyItem['motorcycle']!,
              plate: historyItem['plate']!,
              rentDate: historyItem['rentDate']!,
            );
          },
        );
      }),
    );
  }
}
