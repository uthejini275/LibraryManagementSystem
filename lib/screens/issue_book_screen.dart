// issue_book_screen.dart
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IssueBookScreen extends StatefulWidget {
  const IssueBookScreen({Key? key}) : super(key: key);

  @override
  State<IssueBookScreen> createState() => _IssueBookScreenState();
}

class _IssueBookScreenState extends State<IssueBookScreen> {
  bool isProcessing = false;
  String lastScannedCode = '';

  Future<void> _onBarcodeDetected(BarcodeCapture capture) async {
    final String? code = capture.barcodes.first.rawValue;

    if (code == null || isProcessing || code == lastScannedCode) return;

    setState(() {
      isProcessing = true;
      lastScannedCode = code;
    });

    final url = Uri.parse('http://10.0.2.2:5000/api/books/issue');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'barcode': code,
          'issued_by': 'librarian@example.com', // Replace dynamically if needed
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        _showSnackbar('✅ Book issued successfully!');
      } else {
        final error = json.decode(response.body)['message'] ?? 'Failed to issue book.';
        _showSnackbar('❗ $error');
      }
    } catch (e) {
      _showSnackbar('❗ Error: $e');
    } finally {
      await Future.delayed(const Duration(seconds: 2)); // Wait before allowing next scan
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Book by Scanning'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: _onBarcodeDetected,
            ),
          ),
          const SizedBox(height: 10),
          if (lastScannedCode.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Last Scanned: $lastScannedCode',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
