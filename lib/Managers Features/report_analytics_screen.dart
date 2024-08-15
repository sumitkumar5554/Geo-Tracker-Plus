import 'package:flutter/material.dart';

class ReportsAndAnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports and Analytics')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Example chart or report list
            Expanded(child: ListView(
              children: <Widget>[
                ListTile(title: Text('Travel Patterns Report')),
                ListTile(title: Text('Expense Summary Report')),
              ],
            )),
            ElevatedButton(
              onPressed: () {},
              child: Text('Export Reports'),
            ),
          ],
        ),
      ),
    );
  }
}
