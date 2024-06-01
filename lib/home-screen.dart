import 'package:aplikasi_mobile/member-page.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/home-page.dart';
import 'package:aplikasi_mobile/profile-page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    MemberPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: appColors.bodyText,
        elevation: 10.0,
        backgroundColor: appColors.mainColor,
        leading: Image.asset('assets/images/logo-white.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: appColors.mainColor,
        unselectedItemColor: appColors.secondaryColor,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label:'members'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label:'savings'
          ),
        ],
      ),
    );
  }
}