import 'dart:developer';
import 'dart:io';
import 'package:fcl_baank/utills/app_strings.dart';
import 'package:fcl_baank/utills/global_loader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController _controller = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Store the picked image
      });
    }
  }

  // Method to upload image to Firebase Storage
  Future<String?> _uploadImage(File imageFile) async {
    try {
      if (imageFile == null) {
        print('No image file selected');
        return null;
      }

      // Create a reference to Firebase Storage with a unique path
     final storageRef = FirebaseStorage.instance
    .ref()
    .child('posts/images/${DateTime.now().millisecondsSinceEpoch}_${imageFile.uri.pathSegments.last}');


      // Print the file path to debug
      print("Uploading image from: ${imageFile.path}");

      // Upload the file to Firebase Storage
      await storageRef.putFile(imageFile);

      // Get the download URL after the upload is complete
      String downloadUrl = await storageRef.getDownloadURL();

      // Return the download URL
      print("Image uploaded successfully: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      // Print the error if upload fails
      print("Error uploading image: $e");
      return null;
    }
  }


  // Method to save the data (text + image URL) to Firestore
  Future<void> _saveData(String text, String imageUrl) async {
    try {
      final postRef = FirebaseFirestore.instance.collection('posts').doc();
      await postRef.set({
        'text': text,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(), // Optionally add a timestamp
      });
      Navigator.pop(context);
      _showSuccessMessage(); // Show a success message
    } catch (e) {
      Navigator.pop(context);
      _showErroMessage(error: e.toString());
      print("Error saving data to Firestore: $e");
    }
  }

  // Method to show success message
  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        
        content: Center(
          child: Text(
            'Successfully Saved!',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.green, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.green[100],
      ),
    );
  }
  void _showErroMessage({required String error}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Got Error: $error',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.red, fontSize: 16),
          ),
        ),
        backgroundColor: Colors.green[100],
      ),
    );
  }

  // Method to handle saving the text and image to Firestore
  void _submitData(context) async {
    String text = _controller.text;
    if (text.isNotEmpty && _imageFile != null) {
     showLoader(context: context);
      String? imageUrl = await _uploadImage(_imageFile!);
      if (imageUrl != null) {

        await _saveData(text, imageUrl);
      } else {
        print('Image upload failed');
      }
    } else {
      print('Please enter both text and select an image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Image and Text'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[50],
                ),
                // height: MediaQuery.of(context).size.height / 1.5,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Enter text here',
                              filled: true,
                              fillColor: Colors.grey[300],
                              border: InputBorder.none,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                              onTap: _pickImage, // Trigger image picker
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: double.infinity,
                                color: Colors.grey[300],
                                child: _imageFile == null
                                    ? const Center(
                                        child: Text(
                                          'Tap here to select an image',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : Image.file(
                                        _imageFile!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 50,),
                      GestureDetector(
                        onTap:(){
                           _submitData(context);
                        } ,// Trigger data submission
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 13),
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            border: Border.all(),
                          ),
                          child:  const Text(
                           AppStrings.save,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
