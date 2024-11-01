import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ReviewScreen()));
}

class Review {
  final String userName;
  final String comment;
  final double rating;

  Review({required this.userName, required this.comment, required this.rating});
}

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final List<Review> reviews = [];
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0.0;

  void _submitReview() {
    if (_commentController.text.isNotEmpty && _rating > 0) {
      setState(() {
        reviews.add(Review(
          userName: "User ${reviews.length + 1}",
          comment: _commentController.text,
          rating: _rating,
        ));
        _commentController.clear();
        _rating = 0.0; // Reset rating
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(review.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(review.comment),
                          SizedBox(height: 4),
                          Text("Rating: ${review.rating}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Write a review...'),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<double>(
                    value: _rating,
                    items: [1, 2, 3, 4, 5].map((int rating) {
                      return DropdownMenuItem<double>(
                        value: rating.toDouble(),
                        child: Text('$rating Stars'),
                      );
                    }).toList(),
                    hint: Text('Select Rating'),
                    onChanged: (value) {
                      setState(() {
                        _rating = value ?? 0.0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _submitReview,
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
