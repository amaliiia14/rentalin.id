import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String fullName;
  final String hometown;
  final String phone;
  final String motorcycle;
  final String plate;
  final String rentDate;

  const HistoryCard({
    Key? key,
    required this.fullName,
    required this.hometown,
    required this.phone,
    required this.motorcycle,
    required this.plate,
    required this.rentDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),  // Margin antar kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.blue.withOpacity(0.3),  // Warna border
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding dalam kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Renter's",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            _buildDetailRow("Full Name", fullName),
            _buildDetailRow("Hometown", hometown),
            _buildDetailRow("No Handphone 1", phone),
            _buildDetailRow("Motorcycle", motorcycle),
            _buildDetailRow("Plat Motor", plate),
            _buildDetailRow("Rent Date", rentDate),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),  // Jarak antar row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
