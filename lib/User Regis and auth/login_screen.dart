import 'package:flutter/material.dart';
import 'package:geotracker/User%20Regis%20and%20auth/registration_screen.dart';
import 'package:geotracker/widgets/navbar_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Height of the custom AppBar
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black45, // Outer color for 3D effect
            boxShadow: [
              BoxShadow(
                color: Colors.white
                    .withOpacity(0.4), // Darker shadow for 3D effect
                blurRadius: 12,
                spreadRadius: 6,
                offset: Offset(0, 4), // Adjust shadow position
              ),
            ],
          ),
          child: Container(
            color: Colors.black, // Inner AppBar color
            child: AppBar(
              title: const Text('Geo Tracker',style: TextStyle(color: Colors.white),),
              centerTitle: true,
              backgroundColor:
                  Colors.black, // Make AppBar background transparent
              elevation: 0, // Remove default AppBar shadow
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.black, // Set background color to black
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Update text color to white
                  ),
                ),
                const SizedBox(height: 60),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.black, // Input background color
                    prefixIcon: const Icon(Icons.email,
                        color: Colors.white), // Icon color
                    labelStyle: const TextStyle(
                        color: Colors.white), // Label text color
                    hintStyle: const TextStyle(
                        color: Colors.white54), // Hint text color
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    filled: true,
                    fillColor: Colors.black, // Input background color
                    prefixIcon: const Icon(Icons.lock,
                        color: Colors.white), // Icon color
                    labelStyle: const TextStyle(
                        color: Colors.white), // Label text color
                    hintStyle: const TextStyle(
                        color: Colors.white54), // Hint text color
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
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
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavBarRoots()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.black45, // Button background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Or continue with',
                  style: TextStyle(
                    color: Colors.white, // Update text color to white
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Process Google login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black45, // Button background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        icon: Image.asset('images/google.jpg',
                            height: 20, width: 20),
                        label: const Text(
                          'Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
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
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Process Facebook login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.black45, // Button background color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        icon:
                            Image.asset('images/FB.png', height: 20, width: 20),
                        label: const Text(
                          'Facebook',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()),
                    );
                    // Navigate to registration page
                  },
                  child: const Text(
                    'Don\'t have an account? Create now',
                    style: TextStyle(
                      color: Colors.white, // Update text color to white
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
