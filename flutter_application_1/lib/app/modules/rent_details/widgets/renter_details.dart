import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/rent_details/controllers/detailrent_controller.dart';

class RenterDetailsWidget extends StatelessWidget {
  final RentController controller = Get.find<RentController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF94A3B8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Renter's",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 14),
          _buildDetailRow('Full Name', controller.renterName.value),
          _buildDetailRow('Hometown', controller.hometown.value),
          _buildDetailRow('No Handphone 1', controller.phone1.value),
          _buildDetailRow('No Handphone 2', controller.phone2.value),
          _buildDetailRow('Helm', controller.helmet.value),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFF434C58),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Color(0xFF434C58),
            ),
          ),
        ],
      ),
    );
  }
}
