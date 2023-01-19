import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScreenShot Editor App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.amberAccent,
              height: 200,
              width: 200,
              child: MaterialButton(
                  child: Text("Pick Image"),
                  onPressed: (() {
                    pickImage();
                  })),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.purple,
              height: 90,
              width: 200,
              child: MaterialButton(
                  child: Text(
                    "Take me to Editor",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImagePainterExample()),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
