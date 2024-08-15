import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class OfflineFunc extends StatefulWidget {
  const OfflineFunc({super.key});

  @override
  _StopMonitorState createState() => _StopMonitorState();
}

class _StopMonitorState extends State<OfflineFunc> {
  bool _isRecording = false;
  bool _isUploading = false;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkNetwork();
  }

  Future<void> _startRecording() async {
    setState(() {
      _isRecording = true;
    });
    // Start recording data here
    // For example, you can use the image_picker package to take a photo
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        _image = null;
      }
    });
  }

  Future<void> _stopRecording() async {
    setState(() {
      _isRecording = false;
    });
    // Stop recording data here
  }

  Future<void> _uploadData() async {
    setState(() {
      _isUploading = true;
    });
    // Upload data here
    // For example, you can use the http package to upload the image to a server
    if (_image != null) {
      final url = Uri.parse('https://example.com/upload');
      final request = http.MultipartRequest('POST', url);
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        await _image!.readAsBytes(),
      ));
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Error uploading image');
      }
    }
    setState(() {
      _isUploading = false;
    });
  }

  Future<void> _checkNetwork() async {
    // Check if the device is connected to the internet
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // If connected, upload data
      _uploadData();
    } else {
      // If not connected, start recording data
      _startRecording();
      // Start a timer to periodically check the network connection
      _timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
        final connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          // If connected, stop recording data and upload data
          _stopRecording();
          _uploadData();
          _timer?.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Monitor'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: _isRecording ? _stopRecording : _startRecording,
                  child: Text(
                    _isRecording ? 'Stop Recording' : 'Start Recording',
                    style: const TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: _isRecording ? Colors.red : Colors.blue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _checkNetwork,
                  child: const Text('Upload Data'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _isUploading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                child: Text(
                  _isUploading ? 'Uploading...' : 'Not uploading',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              _image != null
                  ? Center(child: Image.file(_image!))
                  : Center(child: const Text('No image selected')),
            ],
          ),
        ),
      ),
    );
  }
}