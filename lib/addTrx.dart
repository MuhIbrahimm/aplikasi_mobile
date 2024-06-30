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

  String? trxId;
  final _trxType = ValueNotifier<List<Map<String, dynamic>>>([]);

  @override
  void initState() {
    super.initState();
    _fetchTrxType();
  }

  @override
  void dispose() {
    nominalTrxController.dispose();
    jenisTrxController.dispose();
    super.dispose();
  }

  Future<void> _fetchTrxType() async {
    final trxType = await getJenisTrx(context);
    _trxType.value = trxType;
  }

  void _submitTransaction() {
    if (trxId != null) {
      addTrx(
        _storage.read('anggotaId').toString(),
        trxId!,
        nominalTrxController.text.toString(),
        context,
      );

      nominalTrxController.clear();
      setState(() {
        trxId = null;
      });
    } else {
      // Handle error if trxId is null
      print("Error: Jenis transaksi belum dipilih");
    }
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
                        ValueListenableBuilder<List<Map<String, dynamic>>>(
                          valueListenable: _trxType,
                          builder: (context, trxType, _) {
                            return DropdownButtonFormField<String>(
                              value: trxId,
                              onChanged: (String? newValue) {
                                setState(() {
                                  trxId = newValue;
                                });
                              },
                              items: trxType.map<DropdownMenuItem<String>>(
                                  (Map<String, dynamic> item) {
                                return DropdownMenuItem<String>(
                                  value: item['id'].toString(),
                                  child: Text(item['trx_name']),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style:
                                  TextStyles.body.copyWith(color: Colors.black),
                              dropdownColor: Colors.white,
                              hint: const Text('Select Transaction Type'),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Ammout',
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _submitTransaction();
                  Navigator.pushNamed(context, '/home');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(appColors.mainColor),
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