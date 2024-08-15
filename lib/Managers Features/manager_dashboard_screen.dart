import 'package:flutter/material.dart';
import 'package:geotracker/Managers%20Features/monitor_dashboard.dart';
import 'package:geotracker/Managers%20Features/report_analytics_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'ta_validation.dart'; // Ensure this import matches the actual path in your project

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manager Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManagerDashboardScreen(),
      routes: {
        '/taValidation': (context) => const TravelAllowanceValidationScreen(),
        '/monitoringDashboard': (context) => const MonitoringDashboardScreen(),
        '/reportAnalytics': (context) => const ReportAnalyticsScreen(),
      },
    );
  }
}

class ManagerDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager Dashboard'),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Slider
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 150,
              child: ImageSlider(),
            ),
            const SizedBox(height: 20),
            // Tiles
            Column(
              children: [
                Tile(
                  title: 'TA Validation',
                  icon: Icons.check_circle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TravelAllowanceValidationScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Tile(
                  title: 'Monitoring Dashboard',
                  icon: Icons.dashboard,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MonitoringDashboard(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Tile(
                  title: 'Report and Analytics',
                  icon: Icons.analytics,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportsAndAnalyticsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Google Map
            Container(
              height: 300,
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Reports'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;

  final List<String> _images = [
    'images/mnsales1.jpg',
    'images/mnsales2.jpg',
    'images/mnsales3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _images.map((image) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _images.map((image) {
              int index = _images.indexOf(image);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class Tile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  Tile({required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, // Adjust elevation for better shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // More rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.black, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelAllowanceValidationScreen extends StatelessWidget {
  const TravelAllowanceValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TA Validation')),
      body: const Center(child: Text('TA Validation Screen')),
    );
  }
}

class MonitoringDashboardScreen extends StatelessWidget {
  const MonitoringDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monitoring Dashboard')),
      body: const Center(child: Text('Monitoring Dashboard Screen')),
    );
  }
}

class ReportAnalyticsScreen extends StatelessWidget {
  const ReportAnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report and Analytics')),
      body: const Center(child: Text('Report and Analytics Screen')),
    );
  }
}
