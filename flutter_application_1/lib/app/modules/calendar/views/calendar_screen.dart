import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:flutter_application_1/app/modules/calendar/widgets/calender_section.dart';
import 'package:flutter_application_1/app/modules/calendar/widgets/vehicle_list.dart';

class CalendarScreen extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F6),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildCalendarSection(),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VehicleList(vehicles: _getVehicles()),
                    const SizedBox(height: 225),
                  ],
                ),
              ),
            ),
            BottomNavigation(),
            const SizedBox(height: 20),
            _buildBottomIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Color(0xFF1966FF),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Check History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF1966FF),
                  decorationThickness: 2, // Thickness of the underline
                ),
              ),
              Text(
                'Calendar',
                style: TextStyle(
                  fontSize: 16,
                  color:
                      Colors.white70, // Lighter white for the "Calendar" text
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white, // White background for the icon button
              shape: BoxShape.circle, // Circle shape
            ),
            child: IconButton(
              icon: const Icon(Icons.history,
                  color: Colors.black), // Black history icon
              onPressed: () {},
              iconSize: 24, // Set icon size
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection() {
    return CalendarSection();
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

  // Sample Vehicle data
  List<Vehicle> _getVehicles() {
    return [
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
        owner: 'John Doe',
        price: 150000,
        imageUrl: 'assets/images/Rectangle10.png',
      ),
      Vehicle(
        name: 'Nmax 2024',
        status: 'On Booking',
        owner: 'John Doe',
        price: 150000,
        imageUrl: 'assets/images/Rectangle10.png',
      ),
      Vehicle(
        name: 'Nmax 2024',
        status: 'On Booking',
        owner: 'John Doe',
        price: 150000,
        imageUrl: 'assets/images/Rectangle10.png',
      ),
      Vehicle(
        name: 'Nmax 2024',
        status: 'On Booking',
        owner: 'John Doe',
        price: 150000,
        imageUrl: 'assets/images/Rectangle10.png',
      ),
    ];
  }
}

class VehicleList extends StatelessWidget {
  final List<Vehicle> vehicles;

  const VehicleList({Key? key, required this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: vehicles.map((vehicle) {
        return VehicleItemWidget(
          imageUrl: vehicle.imageUrl,
          brand: vehicle.name,
          status: vehicle.status,
          renterName: vehicle.owner,
          price: vehicle.price.toDouble(),
        );
      }).toList(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
      ],
    );
  }
}

class VehicleItemWidget extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String status;
  final String renterName;
  final double price;

  const VehicleItemWidget({
    required this.imageUrl,
    required this.brand,
    required this.status,
    required this.renterName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
            child: Image.asset(
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
                Text(brand,
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 8),
                Text(
                  'Rp. ${price.toString()} /Day',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2567E8)),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: status == 'On Rent' ? Colors.red : Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(renterName,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D))),
              const SizedBox(height: 8),
              const Text('...',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2567E8))),
            ],
          ),
        ],
      ),
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
