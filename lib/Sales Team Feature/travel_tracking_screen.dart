import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class OptimizedTourPage extends StatefulWidget {
  @override
  _OptimizedTourPageState createState() => _OptimizedTourPageState();
}

class _OptimizedTourPageState extends State<OptimizedTourPage> {
  final List<LatLng> _locations = [
    LatLng(37.7749, -122.4194), // San Francisco
    LatLng(34.0522, -118.2437), // Los Angeles
    LatLng(36.1699, -115.1398)  // Las Vegas
  ];

  LatLng _startLocation = LatLng(37.7749, -122.4194); // Default start location
  List<LatLng> _optimizedRoute = [];
  double _totalDistance = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateOptimizedRoute();
  }

  void _calculateOptimizedRoute() async {
    // Dummy implementation: For a real implementation, you would use a routing API
    setState(() {
      _optimizedRoute = _locations;
      _totalDistance = _calculateTotalDistance(_locations);
    });
  }

  double _calculateTotalDistance(List<LatLng> points) {
    double totalDistance = 0.0;

    for (int i = 0; i < points.length - 1; i++) {
      totalDistance += Geolocator.distanceBetween(
        points[i].latitude,
        points[i].longitude,
        points[i + 1].latitude,
        points[i + 1].longitude,
      );
    }

    return totalDistance / 1000; // Convert to kilometers
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery to adapt text sizes and padding based on screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Optimized Tour Plan'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _startLocation,
                zoom: 5.0,
              ),
              markers: _locations.map((loc) {
                return Marker(
                  markerId: MarkerId(loc.toString()),
                  position: loc,
                );
              }).toSet(),
              polylines: _optimizedRoute.isNotEmpty
                  ? {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: _optimizedRoute,
                  color: Colors.blue,
                  width: 5,
                ),
              }
                  : {},
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isWideScreen ? 24.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Optimized Route:',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: isWideScreen ? 24.0 : 20.0,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Distance: ${_totalDistance.toStringAsFixed(2)} km',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: isWideScreen ? 18.0 : 16.0,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calculateOptimizedRoute,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWideScreen ? 32.0 : 24.0,
                      vertical: isWideScreen ? 16.0 : 12.0,
                    ),
                    textStyle: TextStyle(
                      fontSize: isWideScreen ? 18.0 : 16.0,
                    ),
                  ),
                  child: const Text('Recalculate Route'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
