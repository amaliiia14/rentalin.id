import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/calendar/bindings/calendar_binding.dart';
import 'package:flutter_application_1/app/modules/calendar/views/calendar_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calendar',
      home: CalendarScreen(),
      initialBinding: CalendarBinding(),  
    );
  }
}

