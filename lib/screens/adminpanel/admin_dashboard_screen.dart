// File: screens/adminpanel/admin_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:tower_management_app/screens/widgets/dashboard_card.dart'; // Adjust import based on your actual structure
import 'package:tower_management_app/screens/widgets/category_item.dart'; // Adjust import based on your actual structure

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color from Figma
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // This will open the Drawer if you implement it below
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text(
          'Hi Admin!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Handle notification tap
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      // --- Start of Optional: Navigation Drawer ---
      // This is where you would put the code for the left-hand panel
      // from your Figma design ("Admin View", "Pages", "Layers", etc.)
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to TowerPulse!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),

            _buildSearchBar(),
            const SizedBox(height: 24.0),

            _buildMainCardsGrid(context), // Pass context for navigation
            const SizedBox(height: 24.0),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12.0),
            _buildCategoriesRow(context), // Pass context for navigation
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search Here',
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: const Icon(Icons.mic, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  Widget _buildMainCardsGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      childAspectRatio: 0.9,
      children: [
        DashboardCard(
          title: 'Employee Details',
          iconPath:
              'assets/images/employee_icon.png', // Replace with your actual asset path
          backgroundColor: const Color(0xFFE8F2FF),
          onTap: () {
            Navigator.pushNamed(context, '/admin/employee_details');
          },
        ),
        DashboardCard(
          title: 'Tower Details',
          iconPath:
              'assets/images/tower_icon.png', // Replace with your actual asset path
          backgroundColor: const Color(0xFFFFECEB),
          onTap: () {
            Navigator.pushNamed(context, '/admin/tower_details');
          },
        ),
        DashboardCard(
          title: 'Report Analytics',
          iconPath:
              'assets/images/analytics_icon.png', // Replace with your actual asset path
          backgroundColor: const Color(0xFFFFF7E7),
          onTap: () {
            Navigator.pushNamed(context, '/admin/report_analytics');
          },
        ),
        DashboardCard(
          title: 'Safety Measures',
          iconPath:
              'assets/images/safety_icon.png', // Replace with your actual asset path
          backgroundColor: const Color(0xFFE6F8ED),
          onTap: () {
            Navigator.pushNamed(context, '/admin/safety_measures');
          },
        ),
      ],
    );
  }

  Widget _buildCategoriesRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(
            title: 'Attendance',
            iconData: Icons.calendar_today,
            backgroundColor: const Color(0xFFF0F0F0),
            onTap: () {
              Navigator.pushNamed(context, '/admin/attendance');
            },
          ),
          const SizedBox(width: 12.0),
          CategoryItem(
            title: 'Calendar',
            iconData: Icons.event,
            backgroundColor: const Color(0xFFF0F0F0),
            onTap: () {
              Navigator.pushNamed(context, '/admin/calendar');
            },
          ),
          const SizedBox(width: 12.0),
          CategoryItem(
            title: 'Staffs',
            iconData: Icons.people,
            backgroundColor: const Color(0xFFF0F0F0),
            onTap: () {
              Navigator.pushNamed(context, '/admin/staffs');
            },
          ),
          const SizedBox(width: 12.0),
          CategoryItem(
            title: 'Feedback',
            iconData: Icons.feedback,
            backgroundColor: const Color(0xFFF0F0F0),
            onTap: () {
              Navigator.pushNamed(context, '/admin/feedback');
            },
          ),
          const SizedBox(width: 12.0),
          // Add more categories as needed
        ],
      ),
    );
  }
}
