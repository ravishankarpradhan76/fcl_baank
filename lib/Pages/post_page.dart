import 'package:fcl_baank/firebase_services/firestore_service.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _firestoreService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching posts.'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts available.'));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (ctx, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post['text']),
                subtitle: post['imageUrl'] != null
                    ? Image.network(post['imageUrl'])
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
