import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/calendar/controllers/calendar_controller.dart';

class CalendarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(
      builder: (controller) {
        return Container(
          height: 69,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCalendarDay('17', 'MON', controller.selectedDate.value == 17),
              _buildCalendarDay('18', 'TUE', controller.selectedDate.value == 18),
              _buildCalendarDay('19', 'WED', controller.selectedDate.value == 19),
              _buildCalendarDay('20', 'THU', controller.selectedDate.value == 20),
              _buildCalendarDay('21', 'FRI', controller.selectedDate.value == 21),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCalendarDay(String day, String weekday, bool isSelected) {
    return GestureDetector(
      onTap: () {
        Get.find<CalendarController>().updateSelectedDate(int.parse(day));
      },
      child: Container(
        width: 56,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isSelected ? const Color(0xFF1966FF) : const Color(0xFF94A3B8),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              weekday,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: isSelected ? const Color(0xFF1966FF) : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
