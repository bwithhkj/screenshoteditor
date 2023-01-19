import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/image_picker.dart';

void main() => runApp(ScreenShotEditorApp());

class ScreenShotEditorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit your ScreenShots',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
