import 'package:aplikasi_mobile/style.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/api.dart';

final _storage = GetStorage();

class MemberPage extends StatelessWidget {
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
            return Stack(
              children: [
                Container(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: index,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
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
                          title: Text('${_storage.read('nama_${index + 1}')}',
                          style: TextStyles.body.copyWith(color: Colors.white),),
                          subtitle: Text('${_storage.read('telepon_${index + 1}')}',
                          style: TextStyles.body.copyWith(color: Colors.white),),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert, color: Colors.white),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text('Edit'),
                                value: 'Edit',
                              ),
                              PopupMenuItem(
                                child: Text('Delete'),
                                value: 'Delete',
                              ),
                              PopupMenuItem(
                                child: Text('Detail'),
                                value: 'Detail',
                              ),
                            ],
                            onSelected: (value) {
                              if (value == 'Edit') {
                                getEditAnggotaDetail(context, _storage.read('id_${index + 1}'));
                              } 
                              else if (value == 'Delete') {
                                deleteAnggota(context, _storage.read('id_${index + 1}'));
                              } 
                              else if (value == 'Detail') {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('close'),
                                      ),
                                    ],
                                    title: Text('Detail Anggota',
                                    style: TextStyles.h1,),
                                    content: Text(
                                      'Nama: ${_storage.read('nama_${index + 1}')}\n'
                                      'Nomor Induk: ${_storage.read('nomor_induk_${index + 1}')}\n'
                                      'Telepon: ${_storage.read('telepon_${index + 1}')}\n'
                                      'Status Aktif: ${_storage.read('status_aktif_${index + 1}')}\n'
                                      'Alamat: ${_storage.read('alamat_${index + 1}')}\n'
                                      'Tanggal Lahir: ${_storage.read('tgl_lahir_${index + 1}')}',
                                      style: TextStyles.body,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
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
