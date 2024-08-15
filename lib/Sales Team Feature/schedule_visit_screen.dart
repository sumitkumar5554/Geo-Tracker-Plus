import 'package:flutter/material.dart';

class ScheduleVisitsScreen extends StatefulWidget {
  @override
  _ScheduleVisitsScreenState createState() => _ScheduleVisitsScreenState();
}

class _ScheduleVisitsScreenState extends State<ScheduleVisitsScreen> {
  final _clientNameController = TextEditingController();
  final _addressController = TextEditingController();
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Visits', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Extra space to move the text fields further down
              SizedBox(height: 20),

              // Client Name TextField
              TextField(
                controller: _clientNameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.white54),
                  labelText: 'Client Name',
                  labelStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black54,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),

              // Address TextField
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on, color: Colors.white54),
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black54,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              // Date and Time Picker
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDateTime == null
                          ? 'Select Date and Time'
                          : '${_selectedDateTime!.toLocal().toString().split(' ')[0]} ${_selectedDateTime!.toLocal().toString().split(' ')[1]}',
                      style: const TextStyle(fontSize: 16, color: Colors.white54),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.white),
                    onPressed: _pickDate,
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time, color: Colors.white),
                    onPressed: _pickTime,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: _saveVisit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45, // Button background color
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    elevation: 10, // Add elevation for shadow effect
                    shadowColor: Colors.white.withOpacity(0.5), // White shadow color
                  ),
                  child: const Text('Save Visit', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && _selectedDateTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          _selectedDateTime!.hour,
          _selectedDateTime!.minute,
        );
      });
    } else if (pickedDate != null) {
      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );
      });
    }
  }

  Future<void> _pickTime() async {
    if (_selectedDateTime == null) {
      _selectedDateTime = DateTime.now();
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime!),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime!.year,
          _selectedDateTime!.month,
          _selectedDateTime!.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _saveVisit() {
    final clientName = _clientNameController.text;
    final address = _addressController.text;

    if (clientName.isEmpty || address.isEmpty || _selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields and select a date and time.'),
        ),
      );
      return;
    }

    // Implement your save logic here

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Visit Scheduled for ${_selectedDateTime!.toLocal()}'),
      ),
    );

    // Clear the form fields after saving
    _clientNameController.clear();
    _addressController.clear();
    setState(() {
      _selectedDateTime = null;
    });
  }
}
