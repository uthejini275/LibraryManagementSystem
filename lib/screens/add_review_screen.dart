import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddReviewScreen extends StatefulWidget {
  final int bookId;
  final String bookName;

  const AddReviewScreen({required this.bookId, required this.bookName, Key? key}) : super(key: key);

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final _bookIdController = TextEditingController();
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bookIdController.text = widget.bookId.toString(); // 👈 Pre-fill Book ID if available
  }

  void _submitReview() async {
    String bookId = _bookIdController.text.trim();
    String rating = _ratingController.text.trim();
    String comment = _commentController.text.trim();

    if (bookId.isEmpty || rating.isEmpty || comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    String url = 'https://librarymanagementsystem-v9xg.onrender.com/api/books/$bookId/review'; // 👈 Using user entered book ID

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'rating': int.parse(rating),
          'comment': comment,
          'user_id': 1, // Replace with actual user id
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Review added successfully")),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add review: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error occurred while submitting review")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review for ${widget.bookName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _bookIdController,
              decoration: const InputDecoration(labelText: "Book ID"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: "Rating (1 to 5)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(labelText: "Comment"),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitReview,
              child: const Text("Submit Review"),
            ),
          ],
        ),
      ),
    );
  }
}
