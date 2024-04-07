import 'package:aplikasi_mobile/login-page.dart';
import 'package:aplikasi_mobile/register-page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: registerPage()
    );
  }
}