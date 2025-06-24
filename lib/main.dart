import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/verification/login_screen.dart';
import 'screens/verification/register_screen.dart';

// Import the admin screens and widgets
import 'screens/adminpanel/admin_dashboard_screen.dart';
import 'screens/adminpanel/employee_details_screen.dart';
import 'screens/adminpanel/tower_details_screen.dart';
import 'screens/adminpanel/report_analytics_screen.dart';
import 'screens/adminpanel/safety_measures_screen.dart';
import 'screens/adminpanel/attendance_screen.dart';
import 'screens/adminpanel/calendar_screen.dart';
import 'screens/adminpanel/staffs_screen.dart';
import 'screens/adminpanel/feedback_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tower Management',
      debugShowCheckedModeBanner:
          false, // Good for development, set to false for production
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Your existing theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto', // Consider adding a global font if used in Figma
      ),
      initialRoute: '/admin/dashboard',
      // Starts at the splash screen
      // initialRoute: '/', // Uncomment this line if you want to start with the splash screen
      routes: {
        // --- Existing User Frontend Routes ---
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),

        // --- New Admin Frontend Routes ---
        // It's good practice to prefix admin routes, e.g., '/admin/dashboard'
        // to clearly separate them from user-facing routes.
        '/admin/dashboard': (context) => const AdminDashboardScreen(),
        '/admin/employee_details': (context) => const EmployeeDetailsScreen(),
        '/admin/tower_details': (context) => const TowerDetailsScreen(),
        '/admin/report_analytics': (context) => const ReportAnalyticsScreen(),
        '/admin/safety_measures': (context) => const SafetyMeasuresScreen(),
        '/admin/attendance': (context) => const AttendanceScreen(),
        '/admin/calendar': (context) => const CalendarScreen(),
        '/admin/staffs': (context) => const StaffsScreen(),
        '/admin/feedback': (context) => const FeedbackScreen(),
      },
    );
  }
}
