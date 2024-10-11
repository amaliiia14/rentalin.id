import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_application_1/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Login',
      home: LoginView(),
      initialBinding: LoginBinding(),  
    );
  }
}

