import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final _dio = Dio();
    final _storage = GetStorage();
    final _apiUrl = 'https://mobileapis.manpits.xyz/api';

    void login() async {
    try {
      final _response = await _dio.post(
        '${_apiUrl}/login',
        data: {
          'email': emailController.text,
          'password': passwordController.text
        },
      );
      print(_response.data);
      _storage.write('token', _response.data['data']['token']);
    } on DioException catch (e) {
      print('${e.response} - ${e.response?.statusCode}');
    }
  }

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
                labelText: 'Email',
                labelStyle: TextStyles.secondaryText,
                floatingLabelBehavior: FloatingLabelBehavior.auto
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

            Text(
              'Forgot your password?',
              style: TextStyles.secondaryText,
            ),

            const SizedBox(
              height: 32.0,
            ),

            ElevatedButton(
              onPressed: () {
                login();
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

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Create account Now',
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


