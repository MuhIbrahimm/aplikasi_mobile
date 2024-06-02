import 'package:aplikasi_mobile/style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/api.dart';
import 'package:aplikasi_mobile/memberDetail-page.dart';

final _storage = GetStorage();

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

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
            int banyakAnggota = _storage.read('banyak_anggota') ?? 0;
            return Stack(
              children: [
                ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemCount: banyakAnggota,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    int anggotaIndex = index + 1;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MemberDetailPage(memberIndex: anggotaIndex),
                          ),
                        );
                      },
                      child: Container(
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
                            _storage.read('nama_$anggotaIndex') ?? 'Unknown',
                            style: TextStyles.body.copyWith(color: Colors.white),
                          ),
                          subtitle: Text(
                            _storage.read('status_aktif_$anggotaIndex') == 1 ? 'Aktif' : 'Nonaktif',
                            style: TextStyles.body.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
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
              ],
            );
          }
        },
      ),
    );
  }
}
