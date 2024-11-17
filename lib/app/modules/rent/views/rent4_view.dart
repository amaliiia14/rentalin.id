import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/Booking/views/booking_view.dart';
import 'package:rentalin_id/app/modules/home/views/home_view.dart';
import 'package:rentalin_id/app/modules/rent/views/rentDetail_view.dart';

import '../../../data/constant/color.dart';
import '../../../widgets/app_bar.components.dart';
import '../controllers/rent_controller.dart';
import 'rent_view.dart';
import 'rent3_view.dart';

class Rent4View extends GetView<RentController> {
  const Rent4View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 100,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(nameMenu: 'Rent Motorcycle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                motorP(),
                motorI(),
              ],
            ),
            const detRent(),
            const SizedBox(height: 10),
            const BtnBk3(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BtnBook(),
                const SizedBox(width: 10),
                const BtnRent(),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class detRent extends StatelessWidget {
  const detRent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RentController>();
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 20),
      height: 639,
      width: 344,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: tdWhite,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: tdGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            width: 314,
            height: 200,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Detail Renter's",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("Full Name"),
                    Text("Hometown"),
                    Text("No handphone 1"),
                    Text("No handphone 2"),
                    Text("Helm"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(""),
                    Text(controller.fullName.value),
                    Text(controller.hometown.value),
                    Text(controller.phone1.value),
                    Text(controller.phone2.value),
                    Text(controller.helm.value),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: tdGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            width: 314,
            height: 181,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detail Days and Clock",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Start Date"),
                    const SizedBox(width: 90),
                    Text(controller.dateStart.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("End Date"),
                    const SizedBox(width: 95),
                    Text(controller.endDate.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Clock Start"),
                    const SizedBox(width: 173),
                    Text(controller.clockStart.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Clock End"),
                    const SizedBox(width: 180),
                    Text(controller.clockEnd.value),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: tdGrey),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            width: 314,
            height: 181,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Detail Address and Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Delivery Address"),
                    const SizedBox(width: 39),
                    Text(controller.deliveryAddress.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pickup Address"),
                    const SizedBox(width: 46),
                    Text(controller.pickupAddress.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Method Payment"),
                    const SizedBox(width: 135),
                    Text(controller.methodPayment.value),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Payment"),
                    const SizedBox(width: 115),
                    Text(
                      controller.totalPayment.value,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BtnBk3 extends StatelessWidget {
  const BtnBk3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Get.to(const Rent3View());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: tdWhite,
          foregroundColor: tdBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Go Back",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnBook extends StatelessWidget {
  const BtnBook({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RentController>();
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await controller.saveToFirebase();
          Get.to(const HomeView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFF9500),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Booking",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class BtnRent extends StatelessWidget {
  const BtnRent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RentController>();
    return SizedBox(
      width: 163,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          await controller.saveToFirebase();
          Get.to(const HomeView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff34C759),
          foregroundColor: tdWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "Rent Now",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
