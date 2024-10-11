import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:flutter_application_1/app/modules/calendar/widgets/calender_section.dart';
import 'package:flutter_application_1/app/modules/calendar/widgets/vehicle_list.dart';
import 'package:flutter_application_1/app/modules/calendar/widgets/bottom_navigation.dart'; 

class CalendarScreen extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildMainContent(),
              CalendarSection(), 
              VehicleList(),
              const SizedBox(height: 225),
              BottomNavigation(),
              const SizedBox(height: 38),
              _buildBottomIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  // Method yang digunakan pada widget
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Rental Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Main Content Here',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomIndicator() {
    return Container(
      width: 60,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
