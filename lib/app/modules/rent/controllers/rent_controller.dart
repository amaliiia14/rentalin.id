import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentController extends GetxController {
  final fullNameController = TextEditingController();
  final hometownController = TextEditingController();
  final phone1Controller = TextEditingController();
  final phone2Controller = TextEditingController();
  final helmController = TextEditingController();
  final datestartController = TextEditingController();
  final enddateController = TextEditingController();
  final clockstartController = TextEditingController();
  final clockendController = TextEditingController();
  final deliveryController = TextEditingController();
  final pickupController = TextEditingController();
  final methodPaymentController = TextEditingController();
  final totalPaymentController = TextEditingController();

  var rentalDocId = ''.obs;
  var fullName = ''.obs;
  var hometown = ''.obs;
  var phone1 = ''.obs;
  var phone2 = ''.obs;
  var helm = ''.obs;
  var dateStart = ''.obs;
  var endDate = ''.obs;
  var clockStart = ''.obs;
  var clockEnd = ''.obs;
  var deliveryAddress = ''.obs;
  var pickupAddress = ''.obs;
  var methodPayment = ''.obs;
  var totalPayment = ''.obs;

  var rentalHistory = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRentalHistory();
  }

  Future<void> fetchRentalHistory() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('rentals').get();
      rentalHistory.value = snapshot.docs.map((doc) => doc.data()..['id'] = doc.id).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch rental history');
    }
  }

  Future<void> saveToFirebase() async {
    if (fullNameController.text.isEmpty ||
        hometownController.text.isEmpty ||
        phone1Controller.text.isEmpty ||
        phone2Controller.text.isEmpty ||
        helmController.text.isEmpty ||
        datestartController.text.isEmpty ||
        enddateController.text.isEmpty ||
        clockstartController.text.isEmpty ||
        clockendController.text.isEmpty ||
        deliveryController.text.isEmpty ||
        pickupController.text.isEmpty ||
        methodPaymentController.text.isEmpty ||
        totalPaymentController.text.isEmpty) {
      Get.snackbar('Error', 'All fields must be filled');
      return;
    }

    try {
      DocumentReference docRef = await FirebaseFirestore.instance.collection('rentals').add({
        'fullName': fullNameController.text,
        'hometown': hometownController.text,
        'phone1': phone1Controller.text,
        'phone2': phone2Controller.text,
        'helm': helmController.text,
        'dateStart': datestartController.text,
        'endDate': enddateController.text,
        'clockStart': clockstartController.text,
        'clockEnd': clockendController.text,
        'deliveryAddress': deliveryController.text,
        'pickupAddress': pickupController.text,
        'methodPayment': methodPaymentController.text,
        'totalPayment': totalPaymentController.text,
      });

      // Update the observable variables to reflect the saved data
      rentalDocId.value = docRef.id;
      fullName.value = fullNameController.text;
      hometown.value = hometownController.text;
      phone1.value = phone1Controller.text;
      phone2.value = phone2Controller.text;
      helm.value = helmController.text;
      dateStart.value = datestartController.text;
      endDate.value = enddateController.text;
      clockStart.value = clockstartController.text;
      clockEnd.value = clockendController.text;
      deliveryAddress.value = deliveryController.text;
      pickupAddress.value = pickupController.text;
      methodPayment.value = methodPaymentController.text;
      totalPayment.value = totalPaymentController.text;

      fetchRentalHistory();

      Get.snackbar('Success', 'Data has been saved!');
      
      // Call addNotification after saving data successfully
      addNotification();
    } catch (e) {
      Get.snackbar('Error', 'Failed to save data');
    }
  }

  Future<void> addNotification() async {
    try {
      final notificationData = {
        "title": "Rental Completed",
        "message": "Rental by ${fullNameController.text} has been completed.",
        "timestamp": FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('notifications').add(notificationData);

      print("Notification added successfully.");
    } catch (e) {
      print("Failed to add notification: $e");
    }
  }

  Future<void> deleteRental(String docId) async {
  try {
    print("Attempting to delete rental with ID: $docId");
    await FirebaseFirestore.instance.collection('rentals').doc(docId).delete();
    fetchRentalHistory();
    Get.snackbar('Success', 'Rental has been deleted!');
  } catch (e) {
    Get.snackbar('Error', 'Failed to delete rental');
    print("Failed to delete rental: $e");
  }
}


  @override
  void onClose() {
    fullNameController.dispose();
    hometownController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    helmController.dispose();
    datestartController.dispose();
    enddateController.dispose();
    clockstartController.dispose();
    clockendController.dispose();
    deliveryController.dispose();
    pickupController.dispose();
    methodPaymentController.dispose();
    totalPaymentController.dispose();
    super.onClose();
  }
}
