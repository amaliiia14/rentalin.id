import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentalin_id/app/data/constant/color.dart';
import 'package:rentalin_id/app/modules/manage-motorcycle/controllers/camera_motorcycle_controller.dart';
import 'package:rentalin_id/app/widgets/VideoPlayerWidget.dart';
import 'package:rentalin_id/app/widgets/app_bar.components.dart';
import 'package:rentalin_id/app/widgets/input_text_noicon.components.dart';

import '../controllers/add_motorcyle_controller.dart';
import '../models/motorcycle.dart';

class AddMotorcycleDetailView extends GetView<AddMotorcycleController> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final box = GetStorage();
  AddMotorcycleDetailView({super.key});

  Future<bool> _isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> _saveOffline(Map<String, dynamic> data) async {
    List<dynamic> offlineData = box.read<List<dynamic>>('offlineMotorcycles') ?? [];
    offlineData.add(data);
    await box.write('offlineMotorcycles', offlineData);
    Get.snackbar('Offline', 'Data saved locally. It will sync when online.',
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> _syncData() async {
    List<dynamic> offlineData = box.read<List<dynamic>>('offlineMotorcycles') ?? [];
    if (offlineData.isNotEmpty) {
      for (var data in offlineData) {
        await firestore.collection("Manage MotorCycle").add(data);
      }
      await box.remove('offlineMotorcycles');
      Get.snackbar('Online', 'Offline data synced to Firestore.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<String> _uploadImageToFirebase(File selectedImage) async {
    // Implement your Firebase image upload logic here and return the image URL
    // Example: 
    // final storageRef = FirebaseStorage.instance.ref().child('images/${selectedImage.path.split('/').last}');
    // await storageRef.putFile(selectedImage);
    // return await storageRef.getDownloadURL();
    return "https://example.com/image-url"; // Replace with actual URL
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddMotorcycleController());
    final Motorcycle motorcycle = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 80,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(
          nameMenu: 'Add New Motorcycle',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              final controller = Get.find<CameraController>();
              return Container(
                width: 344,
                height: 148,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: controller.selectedImagePath.value.isNotEmpty
                    ? Image.file(
                        File(controller.selectedImagePath.value),
                        fit: BoxFit.cover,
                      )
                    : controller.selectedVideoPath.value.isNotEmpty
                        ? VideoPlayerWidget(
                            videoPath: controller.selectedVideoPath.value,
                          )
                        : Image.asset(
                            "assets/img/img1.jpg",
                            fit: BoxFit.cover,
                          ),
              );
            }),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: tdGrey),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              width: 345,
              height: 217,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Motor",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("Merk Motor"),
                      Text("Motor Name"),
                      Text("Type Motor"),
                      Text("Plat Motor"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(""),
                      Text(motorcycle.merkMotor),
                      Text(motorcycle.motorName),
                      Text(motorcycle.typeMotor),
                      Text(motorcycle.platMotor),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.motorcycle.value.isRecommended,
                      onChanged: (value) {
                        controller.motorcycle.value.isRecommended =
                            value ?? false;
                      },
                    ),
                  ),
                  const Text('Recommended'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InputTextNoIcon(
                labelText: "Price/Day",
                hintText: "Rp. 150.000",
                onChanged: (value) {
                  double? price = double.tryParse(value);
                  if (price != null) {
                    controller.motorcycle.value.pricePerDay = price;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: tdBlue,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: tdBlue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 163,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        'Merk Motor': motorcycle.merkMotor,
                        'Motor Name': motorcycle.motorName,
                        'Plat Motor': motorcycle.platMotor,
                        'Price/Day': motorcycle.pricePerDay,
                        'Recommendation': motorcycle.isRecommended,
                        'Type Motor': motorcycle.typeMotor,
                      };

                      final controller = Get.find<CameraController>();
                      if (controller.selectedImagePath.value.isNotEmpty) {
                        File selectedImage = File(controller.selectedImagePath.value);
                        String imageUrl = await _uploadImageToFirebase(selectedImage);
                        
                        data['Image URL'] = imageUrl;
                      }

                      if (await _isConnected()) {
                        await firestore.collection("Manage MotorCycle").add(data);
                        await _syncData(); 
                      } else {
                        await _saveOffline(data);
                      }

                      Get.snackbar('Success', 'Motorcycle added successfully!',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: tdgreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add New',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
