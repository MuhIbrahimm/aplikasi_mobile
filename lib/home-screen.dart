import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/member-page.dart';
import 'package:aplikasi_mobile/profile-page.dart';
import 'package:aplikasi_mobile/interest-page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MemberPage(),
    const InterestPage(),
    const ProfilePage(),
  ];

  final List<String> _titles = [
    'Members',
    'Interest',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: appColors.bodyText,
        elevation: 10.0,
        backgroundColor: appColors.mainColor,
        leading: Image.asset('assets/images/logo-white.png'),
        title: Text(_titles[_currentIndex],
                style: TextStyles.h2.copyWith(color: Colors.white,)
              ),
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
            icon: Icon(Icons.supervisor_account),
            label: 'Member',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Bunga',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label:'Profile'
          ),
        ],
      ),
    );
  }
}