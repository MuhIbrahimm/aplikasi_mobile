import 'package:aplikasi_mobile/style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MemberDetailPage extends StatefulWidget {
  final int memberIndex;

  const MemberDetailPage({super.key, required this.memberIndex});

  @override
  _MemberDetailPageState createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  final _storage = GetStorage();
  late Future<Map<String, dynamic>> memberFuture;

  @override
  void initState() {
    super.initState();
    memberFuture = getMemberDetails(widget.memberIndex);
  }

  Future<Map<String, dynamic>> getMemberDetails(int index) async {
    return {
      'nama': _storage.read('nama_$index') ?? 'Unknown',
      'nomor_induk': _storage.read('nomor_induk_$index') ?? 'Unknown',
      'telepon': _storage.read('telepon_$index') ?? 'Unknown',
      'status_aktif': _storage.read('status_aktif_$index') ?? 0,
      'alamat': _storage.read('alamat_$index') ?? 'Unknown',
      'tgl_lahir': _storage.read('tgl_lahir_$index') ?? 'Unknown',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Anggota',
          style: TextStyles.h1,
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: memberFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final memberData = snapshot.data!;
            return Padding(
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
                      child: Text(
                        'Nama: ${memberData['nama']}\n'
                        'Nomor Induk: ${memberData['nomor_induk']}\n'
                        'Telepon: ${memberData['telepon']}\n'
                        'Status Aktif: ${memberData['status_aktif'] == 1 ? 'Aktif' : 'Nonaktif'}\n'
                        'Alamat: ${memberData['alamat']}\n'
                        'Tanggal Lahir: ${memberData['tgl_lahir']}',
                        style: TextStyles.body.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
