import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/api.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/style.dart';

class AddTrxPage extends StatefulWidget {
  const AddTrxPage({super.key});

  @override
  State<AddTrxPage> createState() => _AddTrxPageState();
}

class _AddTrxPageState extends State<AddTrxPage> {
  final nominalTrxController = TextEditingController();
  final jenisTrxController = TextEditingController();

  final _storage = GetStorage();

  int jenis_trx = 1;

  @override
  void dispose() {
    nominalTrxController.dispose();
    jenisTrxController.dispose();
    super.dispose();
  }

  void _submitTransaction() {
    addTabungan(
      _storage.read('anggotaId').toString(),
      jenis_trx.toString(),
      nominalTrxController.text.toString(),
      context,
    );

    nominalTrxController.clear();
    setState(() {
      jenis_trx = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Transaction',
          style: TextStyles.h1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: appColors.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Jenis Transaksi',
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                        DropdownButtonFormField<int>(
                          value: jenis_trx,
                          onChanged: (int? newValue) {
                            setState(() {
                              jenis_trx = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text("Saldo Awal"),
                            ),
                            DropdownMenuItem<int>(
                              value: 2,
                              child: Text("Simpanan"),
                            ),
                            DropdownMenuItem<int>(
                              value: 3,
                              child: Text("Penarikan"),
                            ),
                            DropdownMenuItem<int>(
                              value: 4,
                              child: Text("Bunga Simpanan"),
                            ),
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyles.body.copyWith(color: Colors.black),
                          dropdownColor: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Jumlah',
                          style: TextStyles.body.copyWith(color: Colors.white),
                        ),
                        TextFormField(
                          controller: nominalTrxController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Enter amount',
                          ),
                          style: TextStyles.body.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16.0
              ),

              ElevatedButton(
              onPressed: () {
                _submitTransaction();
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
                  'Confirm Transaction',
                  style: TextStyles.body.copyWith(color: Colors.white),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
