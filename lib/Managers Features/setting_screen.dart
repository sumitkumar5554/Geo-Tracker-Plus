import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Profile Settings'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Notification Settings'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Threshold Settings'),
              onTap: () {},
            ),
            ListTile(
              title: Text('CRM Integration Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
