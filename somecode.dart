//drawer


      // --- Start of Optional: Navigation Drawer ---
      // This is where you would put the code for the left-hand panel
      // from your Figma design ("Admin View", "Pages", "Layers", etc.)
      /*
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).primaryColor, // Use your app's primary color
              ),
              child: const Text(
                'Admin Panel',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Already on dashboard, so no navigation needed
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
              ), // Example icon for Employee Details
              title: const Text('Employee Details'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/admin/employee_details');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.apartment,
              ), // Example icon for Tower Details
              title: const Text('Tower Details'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/admin/tower_details');
              },
            ),
            // Add more ListTile items for other admin panel sections like
            // "Pages", "Layers", "Settings", etc., if they exist in your full Figma design.
            // Example for other Categories that might be in the drawer too:
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin/attendance');
              },
            ),
            // ... and so on for other categories like Calendar, Staffs, Feedback if you want them in the drawer
          ],
        ),
      ),
      // --- End of Optional: Navigation Drawer --- 
      // 
      // 
      // import 'package:flutter/material.dart';

class TowerDetailsScreen extends StatelessWidget {
  const TowerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tower Details',
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
              Icons.apartment, // Example icon for towers
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'This is the Tower Details Page',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Manage your tower information and status here!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
      // You can add FloatingActionButton for adding new towers, etc.
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Action for adding new tower
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

      // 
      // 
      // 
      // 
      // */