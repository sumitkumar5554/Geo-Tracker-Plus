import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geotracker/widgets/route_data.dart';

class RouteOptimize extends StatefulWidget {
  const RouteOptimize({super.key});

  @override
  _RouteOptimizeState createState() => _RouteOptimizeState();
}

class _RouteOptimizeState extends State<RouteOptimize> {
  final _formKey = GlobalKey<FormState>();
  final _distanceController = TextEditingController();
  bool _isOptimizing = false;
  RouteData? _routeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Optimize'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Route Optimize Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _distanceController,
                decoration: const InputDecoration(
                  labelText: 'Enter Distance (in meters)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter distance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isOptimizing = true;
                    });
                    try {
                      // Get location data using Nominatim API
                      final locations = await getLocations(_distanceController.text);
                      // Optimize route using OSRM API
                      final optimizedRoute = await optimizeRoute(locations);
                      setState(() {
                        _isOptimizing = false;
                        _routeData = RouteData(
                          startLocation: locations[0],
                          endLocation: locations[1],
                          optimizedRoute: optimizedRoute,
                        );
                      });
                    } catch (e) {
                      setState(() {
                        _isOptimizing = false;
                        // Handle errors appropriately
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      });
                    }
                  }
                },
                child: const Text('Optimize Tour Plan'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _isOptimizing
                  ? const CircularProgressIndicator()
                  : _routeData != null
                  ? Column(
                children: <Widget>[
                  Text(
                    'Start Location: ${_routeData!.startLocation}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'End Location: ${_routeData!.endLocation}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Optimized Route: ${_routeData!.optimizedRoute}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              )
                  : const Text('No route data available'),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getLocations(String distance) async {
    final url = 'https://nominatim.openstreetmap.org/search'
        '?q=restaurants&format=json'
        '&limit=2'
        '&addressdetails=1'
        '&viewbox=-122.519,37.704,-122.358,37.833'
        '&bounded=1'
        '&accept-language=en';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final places = data as List;
      if (places.length < 2) {
        throw Exception('Not enough locations found');
      }
      return places.map((place) => '${place['lat']},${place['lon']}').toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<String> optimizeRoute(List<String> locations) async {
    final start = locations[0];
    final end = locations[1];
    final url = 'http://router.project-osrm.org/route/v1/driving/$start;$end'
        '?overview=false';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final routes = data['routes'] as List;
      if (routes.isNotEmpty) {
        final polyline = routes[0]['geometry']['coordinates'];
        return polyline.map((point) => '${point[1]},${point[0]}').join(' -> ');
      } else {
        throw Exception('No route found');
      }
    } else {
      throw Exception('Failed to optimize route');
    }
  }
}
