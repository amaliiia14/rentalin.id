import 'package:get/get.dart';

class RentController extends GetxController {
  // Informasi motor
  var motorcycleBrand = "Honda".obs;
  var motorcycleModel = "PCX 2024".obs;
  var motorcycleNumber = "KH 1231 WG".obs;
  var motorcycleType = "Matic".obs;
  var rentPrice = "Rp 150.000".obs;
  var rentPriceDuration = "/Day".obs;

  // Informasi penyewa
  var renterName = "Krisna Bimantoro".obs;
  var hometown = "Merjosari".obs;
  var phone1 = "+6281231231".obs;
  var phone2 = "+625464653".obs;
  var helmet = "Cargloss 1".obs;

  // Detail tanggal dan waktu sewa
  var rentStartDate = "27 September 2024".obs;
  var rentEndDate = "29 September 2024".obs;
  var startTime = "13:00 PM".obs;
  var endTime = "17:00 PM".obs;

  // Alamat dan metode pembayaran
  var delivery = "Jln. Tlogomas, SPBU".obs;
  var pickup = "Jln. Tlogomas, SPBU".obs;
  var paymentMethod = "Cash".obs;
  var totalPayment = "Rp. 300.000".obs;

  // Logika tambahan jika ada perubahan
  void updateRenterInfo(String name, String city) {
    renterName.value = name;
    hometown.value = city;
  }

  void updateRentDates(String startDate, String endDate) {
    rentStartDate.value = startDate;
    rentEndDate.value = endDate;
  }
}
