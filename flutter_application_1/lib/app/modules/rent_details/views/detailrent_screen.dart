import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/rent_details/widgets/rent_details.dart';
import 'package:flutter_application_1/app/modules/rent_details/widgets/renter_details.dart';
import 'package:flutter_application_1/app/modules/rent_details/controllers/detailrent_controller.dart';

class DetailRentScreen extends StatelessWidget {
  final RentController controller = Get.put(RentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F6),
      
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
            'Detail Rent',
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
              // Detail rent content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    RentDetail(),
                    SizedBox(height: 10),
                    RenterDetail(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
