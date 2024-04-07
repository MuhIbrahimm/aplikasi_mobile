import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
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
            ),
        
            const SizedBox(
              height: 16.0,
            ),
              
            Text(
              "We're happy to see you again, friend!",
              style: TextStyles.h1,
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(
              height: 8,
            ),

            Text(
              "You know you need to login first, right?",
              style: TextStyles.secondaryText,
              textAlign: TextAlign.center,
            ),
      
            const SizedBox(
            height: 32.0,
            ),
      
            TextField(
              controller: emailController,
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
                hintText: 'Email',
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
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility)),
                ),
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
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Login',
                  style: TextStyles.h2.copyWith(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            Text(
              'Don\'t have account yet?',
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