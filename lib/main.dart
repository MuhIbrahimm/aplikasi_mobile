import 'package:aplikasi_mobile/home-page.dart';
import 'package:aplikasi_mobile/login-page.dart';
import 'package:aplikasi_mobile/register-page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const loginPage(),
        '/register': (context) => const registerPage(),
        '/login': (context) => const loginPage(),
        '/home': (context) => const homePage(),
      },
      initialRoute: '/',
    );
  }
}