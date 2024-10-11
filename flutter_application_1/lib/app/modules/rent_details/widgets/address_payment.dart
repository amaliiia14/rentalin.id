import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/rent_details/controllers/detailrent_controller.dart';

class AddressPayment extends StatelessWidget {
  final RentController rentController = Get.find<RentController>();

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
            'Detail Address and Payment',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color(0xFF0A0A0A),
            ),
          ),
          SizedBox(height: 14),
          _buildDetailRow('Delivery Address', rentController.delivery.value),
          _buildDetailRow('Pickup Address', rentController.pickup.value),
          _buildDetailRow('Method Payment', rentController.paymentMethod.value),
          _buildDetailRow('Total Payment', rentController.totalPayment.value),
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
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFF434C58),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Inter',
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
