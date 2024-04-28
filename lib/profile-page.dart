import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            Center(
              child:
                Icon(Icons.account_circle, size: 120, color: appColors.mainColor,)
            ),
            SizedBox(height: 16),

            // Nama
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center
            ),

            // Email
            Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center
            ),
            SizedBox(height: 16),

            // Kata sandi (dengan karakter tersembunyi)
            TextFormField(
              initialValue: 'password123',
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(appColors.mainColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Save Profile',
                  style: TextStyles.h2.copyWith(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 16,),

            ElevatedButton(
              onPressed: () {
                
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