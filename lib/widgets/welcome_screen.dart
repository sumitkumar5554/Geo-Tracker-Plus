import 'package:flutter/material.dart';
import 'package:geotracker/Managers%20Features/manager_login.dart';
import 'package:geotracker/User%20Regis%20and%20auth/login_screen.dart';
import 'package:geotracker/User%20Regis%20and%20auth/registration_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(75), // Adjust the height of the AppBar if needed
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4), // White shade
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: AppBar(
            backgroundColor:
                Colors.transparent, // Make AppBar background transparent
            elevation: 0, // Remove default shadow
            title: const Center(
              child: Text(
                "Welcome Screen",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      // Set the background color of the Scaffold
      backgroundColor: Colors.black, // Change this to your desired color
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        color: Colors.black, // Change this to your desired color
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 200, // Adjust the width
                height: 200, // Adjust the height
                child: Lottie.network(
                  'https://lottie.host/23103639-78d3-4722-8b53-3cff23999f9b/YVBU7kKLBN.json',
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "Geo Tracker",
              style: TextStyle(
                color: Colors.orange.shade700,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                wordSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Find Best Services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                wordSpacing: 1,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Login Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4), // White shade
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                      color: Colors.black45,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Signup Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.4), // White shade
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                      color: Colors.black45,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ManagerLogin(), // admin signup page
                        ),
                      );
                      // Implement navigation to admin login screen
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.admin_panel_settings,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Login as Manager",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
