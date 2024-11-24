import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUpload {
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from gallery or camera
  Future<File?> pickImage() async {
    // Pick image from gallery or camera
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return null;  // No image selected

    File imageFile = File(pickedFile.path);  // Convert XFile to File
    return imageFile;  // Return the file for display purposes
  }

}
