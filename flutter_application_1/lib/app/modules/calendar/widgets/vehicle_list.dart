import 'package:flutter/material.dart';

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles = [
    Vehicle(
      name: 'PCX 2024',
      status: 'On Rent',
      owner: 'Krisna Bimantoro',
      price: 150000,
      imageUrl: 'assets/images/Rectangle10.png',
    ),
    Vehicle(
      name: 'Nmax 2024',
      status: 'On Booking',
      owner: 'Krisna Bimantoro',
      price: 150000,
      imageUrl: 'assets/images/Rectangle10.png',
    ),
    Vehicle(
      name: 'Nmax 2024',
      status: 'On Booking',
      owner: 'Krisna Bimantoro',
      price: 150000,
      imageUrl: 'assets/images/Rectangle10.png',
    ),
    Vehicle(
      name: 'Nmax 2024',
      status: 'On Booking',
      owner: 'Krisna Bimantoro',
      price: 150000,
      imageUrl: 'assets/images/Rectangle10.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        return VehicleCard(vehicle: vehicles[index]);
      },
    );
  }
}

class Vehicle {
  final String name;
  final String status;
  final String owner;
  final int price;
  final String imageUrl;

  Vehicle({
    required this.name,
    required this.status,
    required this.owner,
    required this.price,
    required this.imageUrl,
  });
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Container to manage image size and add border radius
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0), // Clip the image to the border radius
              child: Container(
                width: 80,
                height: 80,
                child: Image.asset(
                  vehicle.imageUrl,
                  fit: BoxFit.cover, // Fit the image within the container
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(vehicle.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(vehicle.status, style: const TextStyle(color: Colors.blue)),
                  Text('By ${vehicle.owner}'),
                  Text('Rp ${vehicle.price}/Day', style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
