import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';

final _storage = GetStorage();

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAnggota(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            int index = _storage.read('banyak_anggota');
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: index,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: appColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                    title: Text(
                      '${_storage.read('nama_${index + 1}')}', 
                      style: TextStyles.body.copyWith(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Rp.   ${_storage.read('saldo_${index + 1}')}', 
                      style: TextStyles.body.copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context,'/balance');
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
