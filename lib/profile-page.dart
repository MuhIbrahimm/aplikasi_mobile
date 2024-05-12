import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

    @override
    Widget build(BuildContext context) {
      final _storage = GetStorage();
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            const Center(
              child:
                Icon(Icons.account_circle, size: 120, color: appColors.mainColor,)
            ),
            
            const SizedBox(
              height: 16
            ),

            Text(
              _storage.read('name'),
              style: TextStyles.h2.copyWith(color: Colors.black),
              textAlign: TextAlign.center
            ),

            Text(
              _storage.read('email'),
              style: TextStyles.body,
              textAlign: TextAlign.center
            ),

            const SizedBox(
              height: 32
            ),

            ElevatedButton(
              onPressed: () {
                logout();
                Navigator.pushNamed(context, '/');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Logout',
                  style: TextStyles.h2.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
     );
  }
}