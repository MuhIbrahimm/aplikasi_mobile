import 'package:aplikasi_mobile/style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/api.dart';

final _storage = GetStorage();

class BalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createMember');
          },
          tooltip: 'Tambah Anggota',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}