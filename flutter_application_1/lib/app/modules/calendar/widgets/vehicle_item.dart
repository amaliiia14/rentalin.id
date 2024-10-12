import 'package:flutter/material.dart';

class VehicleItemWidget extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String model;
  final String plateNumber;
  final String status;
  final String renterName;
  final double price;

  const VehicleItemWidget({
    required this.imageUrl,
    required this.brand,
    required this.model,
    required this.plateNumber,
    required this.status,
    required this.renterName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6.8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imageUrl,
              width: 103,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(brand, style: const TextStyle(fontSize: 8, color: Colors.black)),
                Text(model, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3D3D3D))),
                Text(plateNumber, style: const TextStyle(fontSize: 8, color: Color(0xFFB5B5B5))),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Rp. ${price.toString()}', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF2567E8))),
                      const TextSpan(text: '/Day', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF94A3B8))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontSize: 8,
                  color: status.contains('On Rent') ? const Color(0xFFFF3B30) : const Color(0xFFFF9500),
                ),
              ),
              Text(
                renterName.isNotEmpty ? renterName : 'Available',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF3D3D3D)),
              ),
              const SizedBox(height: 36),
              const Text('...', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF2567E8))),
            ],
          ),
        ],
      ),
    );
  }
}
