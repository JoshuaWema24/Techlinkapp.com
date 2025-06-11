import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';



class ProfilePictureScreen extends StatefulWidget {
  @override
  _ProfilePictureScreenState createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? _image;
  final picker = ImagePicker();
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isUploading = true;
    });
    // Replace this with your upload logic
    await Future.delayed(Duration(seconds: 1)); // Simulate upload delay
    if (_image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile picture uploaded successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image first.')),
      );
    }
    setState(() {
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Set profile picture', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.blue[100],
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? Icon(Icons.person, size: 70, color: Colors.blue)
                  : null,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.upload, color: Colors.white),
              label: Text('Select Image', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
            SizedBox(height: 30),
           ElevatedButton(
  onPressed: _isUploading ? null : _uploadImage,
  child: _isUploading
      ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 2.5,
          ),
        )
      : Text(
          'Continue',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 37, 140, 236),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
  ),
),

          ],
        ),
      ),
    );
  }
}
