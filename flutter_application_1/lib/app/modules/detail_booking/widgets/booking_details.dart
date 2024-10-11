import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Detail Booking', [
            _buildDetailRow('Full Name', 'Krisna Bimantoro'),
            _buildDetailRow('Hometown', 'Merjosari'),
            _buildDetailRow('No Handphone 1', '+6281231231'),
            _buildDetailRow('No Handphone 2', '+625464653'),
            _buildDetailRow('Helm', 'Cargloss 1'),
          ]),
          const SizedBox(height: 10),
          _buildSection('Detail Days and Clock', [
            _buildDetailRow('Start Date', '27 September 2024'),
            _buildDetailRow('End Date', '29 September 2024'),
            _buildDetailRow('Clock Start', '13:00'),
            _buildDetailRow('Clock End', '17:00'),
          ]),
          const SizedBox(height: 10),
          _buildSection('Detail Address and Payment', [
            _buildDetailRow('Delivery Address', 'Jln. Tlogomas, SPBU'),
            _buildDetailRow('Pickup Address', 'Jln. Tlogomas, SPBU'),
            _buildDetailRow('Method Payment', 'Tunai'),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> details) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF94A3B8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 14),
          ...details,
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
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF434C58),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF434C58),
            ),
          ),
        ],
      ),
    );
  }
}
