import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IssuedBooksScreen extends StatefulWidget {
  const IssuedBooksScreen({super.key});

  @override
  State<IssuedBooksScreen> createState() => _IssuedBooksScreenState();
}

class _IssuedBooksScreenState extends State<IssuedBooksScreen> {
  List issuedBooks = [];

  Future<void> fetchIssuedBooks() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/books/issued');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          issuedBooks = data;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load issued books.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchIssuedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Issued Books')),
      body: ListView.builder(
        itemCount: issuedBooks.length,
        itemBuilder: (context, index) {
          final book = issuedBooks[index];
          return ListTile(
            title: Text(book['title']),
            subtitle: Text('Issued to: ${book['issued_to']}\nDate: ${book['issued_date']}'),
          );
        },
      ),
    );
  }
}
