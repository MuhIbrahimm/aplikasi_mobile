import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  final TextEditingController _interestRateController = TextEditingController();
  late Future<String> activeInterestFuture;
  late Future<List<Map<String, dynamic>>> interestHistoryFuture;

  @override
  void initState() {
    super.initState();
    activeInterestFuture = getBunga();
    interestHistoryFuture = getRiwayatBunga();
  }

  void _setInterestRate(double rate) {
    setState(() {
      _interestRateController.text = rate.toStringAsFixed(2);
    });
  }

  void _submitInterestRate() async {
    final interestRate = _interestRateController.text;
    if (interestRate.isNotEmpty) {
      setState(() {
      });
      await addBunga(interestRate);
      setState(() {
        activeInterestFuture = getBunga();
        interestHistoryFuture = getRiwayatBunga();
      });
    } else {
      print('Harap masukkan nilai bunga');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<double> interestRates = [2.5, 5.0, 7.5, 10.0, 12.5, 15.0];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Active Interest',
                  style: TextStyles.h1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                FutureBuilder<String>(
                  future: activeInterestFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final activeInterest = snapshot.data ?? 'Unknown';
                      return Text(
                        '$activeInterest%',
                        style: TextStyles.h1.copyWith(color: appColors.mainColor),
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ),
                const SizedBox(height: 32.0),
                DecimalTextField(
                  hintText: 'Set new interest value',
                  obscureText: false,
                  controller: _interestRateController,
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: interestRates.map((rate) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          onPressed: () => _setInterestRate(rate),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(appColors.mainColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text(
                            '${rate.toStringAsFixed(2)}%',
                            style: TextStyles.body.copyWith(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _submitInterestRate,
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
                      'Save',
                      style: TextStyles.h2.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: Text(
                    'Interest History',
                    style: TextStyles.h1,
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: interestHistoryFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final interestHistory = snapshot.data ?? [];
                        return ListView.builder(
                          itemCount: interestHistory.length,
                          itemBuilder: (context, index) {
                            final interest = interestHistory[interestHistory.length - 1 - index];
                            return Card(
                              color: appColors.mainColor,
                              child: ListTile(
                                title: Text(
                                  'Interest: ${interest['persen']}%',
                                  style: TextStyles.body.copyWith(color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Active: ${interest['isaktif'] == 1 ? 'Yes' : 'No'}',
                                  style: TextStyles.body.copyWith(color: Colors.white),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DecimalTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const DecimalTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        ],
        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
