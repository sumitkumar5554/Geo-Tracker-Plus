import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Import if using `SchedulerBinding`
import 'package:geotracker/widgets/welcome_screen.dart';

import 'registration_screen.dart'; // Import the RegistrationScreen

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Start a Future to navigate after a delay
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ),
        );
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png', // Ensure this path is correct and the image exists
              width: 150, // You can adjust the width as needed
              height: 150, // You can adjust the height as needed
            ),
            const SizedBox(height: 70),
            const Text(
              'Welcome to GeoTracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
