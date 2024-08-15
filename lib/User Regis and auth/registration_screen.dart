import 'package:flutter/material.dart';
import 'package:geotracker/User%20Regis%20and%20auth/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextField('Name', Icons.person),
            const SizedBox(height: 16),
            _buildTextField('Email', Icons.email, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            _buildTextField('Password', Icons.lock, obscureText: true),
            const SizedBox(height: 16),
            _buildTextField('Confirm Password', Icons.lock, obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Make the button width fill the available space and set height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Circular button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return Container(
      width: double.infinity, // Makes the TextField expand to fill available width
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Padding inside TextField
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Circular border
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5), // Border color with opacity
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Circular border
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5), // Border color with opacity
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Circular border
            borderSide: const BorderSide(
              color: Colors.blue, // Border color when focused
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Colors.white, // Background color inside TextField
        ),
      ),
    );
  }
}
