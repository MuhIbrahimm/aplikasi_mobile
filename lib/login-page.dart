import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';



class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
              image: AssetImage('assets/images/login.png'),
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
        
            const SizedBox(
              height: 16.0,
            ),
              
              Center(
                child: Text(
                  "We're happy to see you again, friend!",
                  style: TextStyles.h1,
                  textAlign: TextAlign.center,
                ),
              ),
        
              const SizedBox(
              height: 32.0,
              ),
        
              TextField(
                controller: usernameController,
                style: TextStyles.body,
        
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: appColors.mainColor,
                    ),
                    borderRadius: BorderRadius.circular(10),                
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: appColors.mainColor,
                    ),
                    borderRadius: BorderRadius.circular(10),                
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyles.secondaryText,
                ),
              ),
        
              const SizedBox(
                height: 16.0,
              ),
        
              TextField(
                controller: passwordController,
                style: TextStyles.body,
                obscureText: true,
        
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: appColors.mainColor,
                    ),
                    borderRadius: BorderRadius.circular(10),                
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: appColors.mainColor,
                    ),
                    borderRadius: BorderRadius.circular(10),                
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyles.secondaryText,
                ),
              ),

              const SizedBox(
                height: 16.0,
              ),

              Text(
                'Forgot your password?',
                style: TextStyles.secondaryText,
              ),

            const SizedBox(
              height: 32.0,
            ),

            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(appColors.mainColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'LOGIN',
                  style: TextStyles.h1.copyWith(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            Text(
              'Don\'t have account?',
              style: TextStyles.secondaryText,
              textAlign: TextAlign.center,
            ),
            Text(
              'Register Now',
              style: TextStyles.secondaryText.copyWith(color: appColors.mainColor),
              textAlign: TextAlign.center,
            ),
          ],
          ),
        ),
      ),
    );
  }
}