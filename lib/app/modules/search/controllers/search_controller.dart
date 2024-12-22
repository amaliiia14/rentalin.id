import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' ;

class SearchingController extends GetxController {
  //TODO: Implement SearchController

  @override
  void onInit() {
    super.onInit();
    _initSpeech(); 
  }

  final SpeechToText _speech = SpeechToText();

  var isListening = false.obs; 
  var text = "".obs; 

  void _initSpeech() async {
    try {
      await _speech.initialize();
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {

      await Permission.microphone.request();
    }
  }

  void startListening() async {
    await checkMicrophonePermission();
    if (await Permission.microphone.isGranted) {
      isListening.value = true;
      await _speech.listen(onResult: (result) {

        text.value = result.recognizedWords;
      });
    } else {
      print("Izin mikrofon ditolak.");
    }
  }

  void stopListening() async {
    isListening.value = false;
    await _speech.stop();
  }
}