import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

Future<String> uploadImageToFirebase(File imageFile) async {
  try {
    String fileName = basename(imageFile.path); 
    Reference storageRef = FirebaseStorage.instance.ref().child('motorcycles/$fileName');

    UploadTask uploadTask = storageRef.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception("Gagal mengunggah gambar: $e");
  }
}

Future<String> uploadVideoToFirebase(File videoFile) async {
  try {
    String fileName = basename(videoFile.path); 
    Reference storageRef = FirebaseStorage.instance.ref().child('motorcycles/videos/$fileName');

    UploadTask uploadTask = storageRef.putFile(videoFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception("Gagal mengunggah video: $e");
  }
}

class CameraController extends GetxController {
  final ImagePicker _picker = ImagePicker(); 
  final box = GetStorage(); 

  var selectedImagePath = ''.obs; 
  var isImageLoading = false.obs; 

  var selectedVideoPath = ''.obs;
  var isVideoPlaying = false.obs;
  VideoPlayerController? videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    _loadStoredData();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        box.write('imagePath', pickedFile.path);

        File selectedImage = File(pickedFile.path);
        String imageUrl = await uploadImageToFirebase(selectedImage);

        await saveMotorcycleData(imageUrl, ''); 
        print("URL Gambar: $imageUrl");
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  Future<void> pickVideo(ImageSource source) async {
    try {
      isImageLoading.value = true;
      final XFile? pickedFile = await _picker.pickVideo(source: source);
      if (pickedFile != null && File(pickedFile.path).existsSync()) {
        selectedVideoPath.value = pickedFile.path;
        box.write('videoPath', pickedFile.path);

        File selectedVideo = File(pickedFile.path);
        String videoUrl = await uploadVideoToFirebase(selectedVideo);

        await saveMotorcycleData('', videoUrl);
        print("URL Video: $videoUrl");

        videoPlayerController = VideoPlayerController.file(selectedVideo)
          ..initialize().then((_) {
            videoPlayerController!.play();
            isVideoPlaying.value = true; 
            update(); 
          });
      } else {
        print('No video selected.');
      }
    } catch (e) {
      print('Error picking video: $e');
    } finally {
      isImageLoading.value = false;
    }
  }

  void _loadStoredData() {
    selectedImagePath.value = box.read('imagePath') ?? '';
    selectedVideoPath.value = box.read('videoPath') ?? '';

    if (selectedVideoPath.value.isNotEmpty) {
      videoPlayerController = VideoPlayerController.file(File(selectedVideoPath.value))
        ..initialize().then((_) {
          videoPlayerController!.play();
          isVideoPlaying.value = true;
          update(); 
        });
    }
  }

  void play() {
    videoPlayerController?.play();
    isVideoPlaying.value = true; 
    update(); 
  }

  void pause() {
    videoPlayerController?.pause();
    isVideoPlaying.value = false; 
    update(); 
  }

  void togglePlayPause() {
    if (videoPlayerController != null) {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isVideoPlaying.value = false; 
      } else {
        videoPlayerController!.play();
        isVideoPlaying.value = true; 
      }
      update(); 
    }
  }

  Future<void> saveMotorcycleData(String imageUrl, String videoUrl) async {
    try {
      await FirebaseFirestore.instance.collection("motorcycles").add({
        'image_url': imageUrl,
        'video_url': videoUrl,
      });
    } catch (e) {
      print("Error saving data to Firestore: $e");
    }
  }
}
