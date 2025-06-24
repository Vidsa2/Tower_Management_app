import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.black,
          ), // Match Admin Dashboard AppBar title color
        ),
        backgroundColor: Colors.white, // Match Admin Dashboard AppBar color
        elevation: 0, // No shadow
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Back button color
        centerTitle: true, // Center the title
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.feedback, // Example icon for feedback
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'This is the Feedback Page',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'View, manage, and respond to user feedback here!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      // You might add a FloatingActionButton for adding a new feedback response or filter
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Action for new feedback or filter
      //   },
      //   child: Icon(Icons.add_comment),
      // ),
    );
  }
}
