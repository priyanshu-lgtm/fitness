import 'package:fitness/Pages/Home.dart';
import 'package:flutter/material.dart';

import 'package:fitness/Pages/DetailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Detailscreen(),
    );
  }
}
