import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';

class createMemberPage extends StatefulWidget {
  const createMemberPage({super.key});

  @override
  State<createMemberPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<createMemberPage> {
  final nomorIndukController = TextEditingController();
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final ttlController = TextEditingController();
  final teleponController = TextEditingController();
  int status_aktif = 1;

  bool isVisible = false;
  bool isVisibleConfirm = false;

  void dispose() {
    nomorIndukController.dispose();
    namaController.dispose();
    alamatController.dispose();
    ttlController.dispose();
    teleponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Member',
          style: TextStyles.h1
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [        
            formInput('Registration Number', nomorIndukController),
            formInput('Name', namaController),
            formInput('Address', alamatController),
            formInput('Date of Birth', ttlController),
            formInput('Telephone', teleponController),
            
            ElevatedButton(
              onPressed: () {
                createAnggota(
                  context,
                  int.parse(nomorIndukController.text),
                  teleponController.text,
                  status_aktif = 1,
                  namaController.text,
                  alamatController.text,
                  ttlController.text,
                );
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
                  'Submit',
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

Widget formInput(String label, TextEditingController controller) {
  return 
    Column(
      children: [
        TextField(
          controller: controller,
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
            labelText: label,
            labelStyle: TextStyles.secondaryText,
            floatingLabelBehavior: FloatingLabelBehavior.auto
          ),
        ),
        const SizedBox(
              height: 16.0,
            ),
      ],
    );
}