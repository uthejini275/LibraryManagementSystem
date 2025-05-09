import 'package:flutter/material.dart';
import 'add_book_screen.dart';
import 'issue_book_screen.dart';
import 'login_screen.dart';
import 'return_book_screen.dart';
import 'issued_books_screen.dart';
import 'profile_screen.dart';
import 'search_books_screen.dart';
import 'add_review_screen.dart';

class DashboardScreen extends StatelessWidget {
  final String name;
  final String role;
  final String email;

  const DashboardScreen({
    Key? key,
    required this.name,
    required this.role,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name ($role)'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    name: name,
                    role: role,
                    email: email,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            if (role == 'librarian')
              _buildDashboardCard(
                context,
                icon: Icons.qr_code_scanner,
                title: 'Issue Book',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IssueBookScreen(),
                    ),
                  );
                },
              ),
            _buildDashboardCard(
              context,
              icon: Icons.assignment_return,
              title: 'Return Book',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReturnBookScreen(),
                  ),
                );
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.library_books,
              title: 'Issued Books',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IssuedBooksScreen(),
                  ),
                );
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.search,
              title: 'Search Books',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchBooksScreen(),
                  ),
                );
              },
            ),
            _buildDashboardCard(
              context,
              icon: Icons.rate_review,
              title: 'Add Review',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddReviewScreen(
                      bookId: 1, // 👈 Temporary static book ID for testing
                      bookName: 'Sample Book', // 👈 You need to pass some book name too
                    ),
                  ),
                );
              },
            ),
            // Inside your list of dashboard cards
            if (role == 'librarian') ...[
              _buildDashboardCard(
                context,
                icon: Icons.add_box,
                title: 'Add Book',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddBookScreen(),
                    ),
                  );
                },
              ),
            ],




            _buildDashboardCard(
              context,
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 🔧 Helper function for card creation
  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.blue),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

