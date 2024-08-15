import 'package:flutter/material.dart';
import 'package:geotracker/Managers%20Features/manager_dashboard_screen.dart';
import 'package:geotracker/Managers%20Features/report_analytics_screen.dart';
import 'package:geotracker/Managers%20Features/setting_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/home_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/schedule_visit_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/ta_claim_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/travel_tracking_screen.dart';
import 'package:geotracker/User%20Regis%20and%20auth/login_screen.dart';
import 'package:geotracker/User%20Regis%20and%20auth/registration_screen.dart';

import 'User Regis and auth/splash_screen.dart';

void main() {
  runApp(GeoTrackerApp());
}

class GeoTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoTracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => Dashboard(),
        '/schedule': (context) => ScheduleVisitsScreen(),
        '/tracking': (context) => OptimizedTourPage(),
        '/ta_claims': (context) => TAClaimsScreen(),
        '/manager_dashboard': (context) => ManagerDashboardScreen(),
        '/reports': (context) => ReportsAndAnalyticsScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        // Handle named routes or dynamic routes if needed
        return null;
      },
    );
  }
}
