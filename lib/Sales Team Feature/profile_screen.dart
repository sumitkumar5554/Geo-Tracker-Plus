import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/0profile.jpg'), // Replace with actual image
                ),
              ),
              SizedBox(height: 20),

              // Name
              Text(
                'Raziul Islam', // Replace with actual name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // Email
              Text(
                'raziul.cse@gmail.com', // Replace with actual email
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 20),

              // Profile Details
              Text(
                'Profile Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              // Phone Number
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                trailing: Text('+8801712345678'), // Replace with actual number
              ),

              // Address
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address'),
                trailing: Text('Dhaka, Bangladesh'), // Replace with actual address
              ),

              // Other details (add more ListTile widgets as needed)
            ],
          ),
        ),
      ),
    );
  }
}
