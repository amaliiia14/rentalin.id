import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPageController extends GetxController {
  //TODO: Implement WebviewPageController

  final count = 0.obs;



  void increment() => count.value++;
    // final String url = 'https://chibirentalmotormalang.com/';


  WebViewController webViewController(String uri) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(uri));
  }

}
