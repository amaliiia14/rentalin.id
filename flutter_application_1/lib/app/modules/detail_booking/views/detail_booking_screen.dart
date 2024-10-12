import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_booking_controller.dart';
import '../widgets/header.dart';
import '../widgets/vehicle_info.dart';
import '../widgets/booking_details.dart';
import '../widgets/action_buttons.dart';

class DetailBookingScreen extends StatelessWidget {
  final DetailBookingController controller = Get.put(DetailBookingController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF1966FF),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Align(
          alignment: Alignment.centerRight, 
          child: const Text(
            'Detail Booking',
            style: TextStyle(
              color: Color(0xFF1966FF),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              VehicleInfo(),
              BookingDetails(),
              ActionButtons(),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                width: screenWidth * 0.4,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
