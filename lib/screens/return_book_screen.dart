import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReturnBookScreen extends StatefulWidget {
  const ReturnBookScreen({super.key});

  @override
  State<ReturnBookScreen> createState() => _ReturnBookScreenState();
}

class _ReturnBookScreenState extends State<ReturnBookScreen> {
  String scannedCode = '';

  // Function that handles the barcode scan result
  Future<void> _onBarcodeDetected(BarcodeCapture capture) async {
    final String? code = capture.barcodes.first.rawValue;

    if (code == null) return;

    setState(() {
      scannedCode = code;
    });

    // Show barcode detected message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Scanned: $scannedCode')),
    );

    // Backend URL to return the book
    final url = Uri.parse('http://10.0.2.2:5000/api/books/return');

    try {
      // Sending barcode to backend
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'barcode': scannedCode}),
      );

      // Handling the response from backend
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Book returned successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to return book.')),
        );
      }
    } catch (e) {
      // Handling errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Return Book')),
      body: Column(
        children: [
          // Barcode scanner view
          Expanded(
            child: MobileScanner(
              onDetect: (BarcodeCapture capture) {
                _onBarcodeDetected(capture);
              },
            ),
          ),
          // Display the scanned barcode
          if (scannedCode.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Scanned Code: $scannedCode'),
            ),
        ],
      ),
    );
  }
}
