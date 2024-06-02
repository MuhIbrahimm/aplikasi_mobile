import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';


class  RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
              image: AssetImage('assets/images/register.png'),
              fit: BoxFit.fitWidth,
            ),
        
            const SizedBox(
              height: 16.0,
            ),
              
            Text(
              "Hey, nice to meet you",
              style: TextStyles.h1,
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(
              height: 8,
            ),

            Text(
              "Can you tell us about yourself?",
              style: TextStyles.secondaryText,
              textAlign: TextAlign.center,
            ),
      
            const SizedBox(
            height: 32.0,
            ),

            TextField(
              controller: nameController,
              style: TextStyles.body.copyWith(fontSize: 16.0),
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
                labelText: 'Fullname',
                labelStyle: TextStyles.secondaryText,
                floatingLabelBehavior: FloatingLabelBehavior.auto
              ),
            ),
      
            const SizedBox(
              height: 16.0,
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
                labelText: 'Email',
                labelStyle: TextStyles.secondaryText,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                labelText: 'Password',
                labelStyle: TextStyles.secondaryText,
                floatingLabelBehavior: FloatingLabelBehavior.auto
              ),
            ),

            const SizedBox(
              height: 16.0,
            ),

            TextField(
              controller: confirmPasswordController,
              style: TextStyles.body.copyWith(fontSize: 16.0),
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
                labelText: 'Confirm password',
                labelStyle: TextStyles.secondaryText,
                floatingLabelBehavior: FloatingLabelBehavior.auto
              ),
            ),

            const SizedBox(
              height: 32.0,
            ),

            ElevatedButton(
              onPressed: () {
                register(nameController.text, emailController.text, passwordController.text);
                Navigator.pushNamed(context, '/home');
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
                  'Create account',
                  style: TextStyles.h2.copyWith(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            Text(
              'Already have an account',
              style: TextStyles.secondaryText,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Login to Your Account',
                style: TextStyles.secondaryText.copyWith(color: appColors.mainColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}