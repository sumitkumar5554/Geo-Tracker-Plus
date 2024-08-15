import 'package:flutter/material.dart';
import 'package:geotracker/Sales%20Team%20Feature/offline_func.dart';
import 'package:geotracker/Sales%20Team%20Feature/route_optimization.dart';
import 'package:geotracker/Sales%20Team%20Feature/schedule_visit_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/stop_monitor.dart';
import 'package:geotracker/Sales%20Team%20Feature/ta_claim_screen.dart';
import 'package:geotracker/Sales%20Team%20Feature/travel_tracking_screen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final double cardHeight = 150; // Fixed height for all cards
  final double cardWidth = 150; // Fixed width for all cards

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sales Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black, // Set AppBar color to black
        elevation: 0, // Remove default shadow
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,
                color: Colors.white), // White notification icon
            onPressed: () {
              // Handle notification icon press here
            },
          ),
        ],
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCard('Schedule Visit', Icons.calendar_today, '10', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScheduleVisitsScreen()),
                );
              }),
              const SizedBox(width: 20),
              buildCard('Travel Tracking', Icons.location_pin, '20', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OptimizedTourPage()),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCard('Route Optimization', Icons.route, '30', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteOptimize()),
                );
              }),
              const SizedBox(width: 20),
              buildCard('Offline Functionality', Icons.cloud_off, '40', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OfflineFunc()),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCard('Stop Monitoring', Icons.stop, '50', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StopMonitor()),
                );
              }),
              const SizedBox(width: 20),
              buildCard('TA Claim', Icons.attach_money, '60', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TAClaimsScreen()),
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.black, // Inner color of the Card
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.4), // Outer shadow color
                  blurRadius: 12, // Increased blur for a more pronounced shadow
                  spreadRadius: 6, // Increased spread for a 3D effect
                  offset: const Offset(4, 4), // Slight offset for the 3D effect
                ),
              ],
            ),
            child: Card(
              elevation: 0, // Remove default Card elevation
              color: Colors.black, // Transparent color for Card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sales Chart',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200, // Set a fixed height for the inner ListView
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Deal $index',
                                style: const TextStyle(
                                    color: Colors.white)), // Text color
                            subtitle: Text('\$${index * 1000}',
                                style: const TextStyle(
                                    color: Colors.white54)), // Subtitle text color
                            trailing: Text('${index * 10}%',
                                style: const TextStyle(
                                    color: Colors.white)), // Trailing text color
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, IconData icon, String value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          color: Colors.black, // Inner color of the Card
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4), // Outer shadow color
              blurRadius: 12, // Increased blur for a more pronounced shadow
              spreadRadius: 6, // Increased spread for a 3D effect
              offset: const Offset(4, 4), // Slight offset for the 3D effect
            ),
          ],
        ),
        child: Card(
          elevation: 0, // Remove default Card elevation
          color: Colors.transparent, // Transparent color for Card
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Text color
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 24, color: Colors.white), // Icon color
                    const SizedBox(width: 10),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
