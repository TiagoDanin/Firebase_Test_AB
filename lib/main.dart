import 'package:firebase_test_ab/test_ab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Test A/B',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const ABTestPage(),
    );
  }
}
