import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save data
  Future<void> saveData(String text, String imageUrl) async {
    try {
      await _db.collection('posts').add({
        'text': text,
        'imageUrl': imageUrl,
        'createdAt': Timestamp.now(),
      });
      print("Data saved successfully.");
    } catch (e) {
      print("Error saving data: $e");
    }
  }

  // Fetch data
  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      QuerySnapshot snapshot = await _db.collection('posts').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }
}
