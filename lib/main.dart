import 'package:aplikasi_mobile/addTrx.dart';
import 'package:aplikasi_mobile/createMember-page.dart';
import 'package:aplikasi_mobile/editMember-page.dart';
import 'package:aplikasi_mobile/home-screen.dart';
import 'package:aplikasi_mobile/login-page.dart';
import 'package:aplikasi_mobile/memberDetail-page.dart';
import 'package:aplikasi_mobile/register-page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await GetStorage.init('newStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeScreen(),
        '/editMember': (context) => const EditMemberPage(),
        '/createMember': (context) => const CreateMemberPage(),
        '/detailMember': (context) => MemberDetailPage(),
        '/addTrx': (context) => const AddTrxPage(),
      },
      initialRoute: '/',
    );
  }
}