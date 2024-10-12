import 'package:flutter/material.dart';

class RenterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 6 : 10,
        horizontal: screenWidth * 0.01, 
      ),
      padding: EdgeInsets.all(isSmallScreen ? 18 : 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            'Detail Renter',
            [
              _buildDetailRow('Full Name', 'Krisna Bimantoro'),
              _buildDetailRow('Hometown', 'Merjosari'),
              _buildDetailRow('No Handphone 1', '+6281231231'),
              _buildDetailRow('No Handphone 2', '+625464653'),
              _buildDetailRow('Helm', 'Cargloss 1'),
            ],
            isSmallScreen,
          ),
          const SizedBox(height: 10),
          _buildSection(
            'Detail Days and Time',
            [
              _buildDetailRow('Start Date', '27 September 2024'),
              _buildDetailRow('End Date', '29 September 2024'),
              _buildDetailRow('Clock Start', '13:00'),
              _buildDetailRow('Clock End', '17:00'),
            ],
            isSmallScreen,
          ),
          const SizedBox(height: 10),
          _buildSection(
            'Detail Address and Payment',
            [
              _buildDetailRow('Delivery Address', 'Jln. Tlogomas, SPBU'),
              _buildDetailRow('Pickup Address', 'Jln. Tlogomas, SPBU'),
              _buildDetailRow('Payment Method', 'Tunai'),
              _buildDetailRow('Total Payment', 'Rp. 300.000'),
            ],
            isSmallScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> details, bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 18 : 22),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF94A3B8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 14),
          Column(children: details),
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
          Flexible( 
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF434C58),
              ),
              overflow: TextOverflow.ellipsis, 
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF434C58),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
