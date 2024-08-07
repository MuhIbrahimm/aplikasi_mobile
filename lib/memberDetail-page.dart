import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aplikasi_mobile/api.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:intl/intl.dart';

class MemberDetailPage extends StatefulWidget {
  const MemberDetailPage({Key? key}) : super(key: key);

  @override
  _MemberDetailPageState createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  final _storage = GetStorage();
  late Future<Map<String, dynamic>> memberFuture;

  @override
  void initState() {
    super.initState();
    getSaldo(_storage.read('anggotaId'));
    memberFuture = getMemberDetails();
  }

  Future<Map<String, dynamic>> getMemberDetails() async {
    var saldo = _storage.read('saldo_${_storage.read('anggotaId')}');
    
    if (saldo == null) {
      await getSaldo(_storage.read('anggotaId'));
      saldo = _storage.read('saldo_${_storage.read('anggotaId')}');
    }

    return {
      'name': _storage.read('anggota_nama') ?? '',
      'address': _storage.read('anggota_alamat') ?? '',
      'birthDate': _storage.read('anggota_tgl_lahir') ?? '',
      'telephone': _storage.read('anggota_telepon') ?? '',
      'statusAktif': _storage.read('anggota_status_aktif') ?? 1,
      'saldo': saldo ?? 0,
    };
  }

  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Member Details',
          style: TextStyles.h1,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }
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
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        children: [
                          TableRow(
                            children: [
                              Text('Name', style: TextStyles.body.copyWith(color: Colors.white)),
                              Text(': ${memberData['name']}', style: TextStyles.body.copyWith(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('Address', style: TextStyles.body.copyWith(color: Colors.white)),
                              Text(': ${memberData['address']}', style: TextStyles.body.copyWith(color: Colors.white),
                              maxLines: 2, overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('Date of Birth', style: TextStyles.body.copyWith(color: Colors.white)),
                              Text(': ${memberData['birthDate']}', style: TextStyles.body.copyWith(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('Telephone', style: TextStyles.body.copyWith(color: Colors.white)),
                              Text(': ${memberData['telephone']}', style: TextStyles.body.copyWith(color: Colors.white)),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text('Status', style: TextStyles.body.copyWith(color: Colors.white)),
                              Text(': ${memberData['statusAktif'] == 1 ? 'Active' : 'Nonactive'}', style: TextStyles.body.copyWith(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: appColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Balance:', style: TextStyles.h2.copyWith(color: Colors.white)),
                          Text(formatCurrency(memberData['saldo']), style: TextStyles.h2.copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16
                  ),
            
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          getEditAnggotaDetail(context, _storage.read('anggotaId'));
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
                            'Edit Member',
                            style: TextStyles.body.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
            
                      const SizedBox(
                        width: 16
                      ),
            
                      
                      ElevatedButton(
                        onPressed: () {
                          deleteAnggota(context, _storage.read('anggotaId'));
                      
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Hapus Member',
                            style: TextStyles.body.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 16
                  ),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addTrx');
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
                        'Add Transaction',
                        style: TextStyles.body.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0
                  ),
                  Center(
                    child: Text(
                      'Transaction History',
                      style: TextStyles.h1,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0
                  ),
                  Expanded(
                    child: Container(
                      child: FutureBuilder(
                        future: getRiwayat(_storage.read('anggotaId')),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else {
                            int itemCount = _storage.read('banyak_riwayat') ?? 0;
                            if (itemCount == 0) {
                              return Center(child: Text('No transaction history available.'));
                            }
                            return ListView.builder(
                              itemCount: itemCount,
                              itemBuilder: (context, index) {
                                int reversedIndex = itemCount - 1 - index;
                                Color cardColor;
                                IconData iconData;
                                
                                switch (_storage.read('trx_id_$reversedIndex') ?? 0) {
                                  case 1:
                                    iconData = Icons.attach_money;
                                    cardColor = appColors.mainColor;
                                    break;
                                  case 2:
                                    iconData = Icons.add;
                                    cardColor = Colors.green;
                                    break;
                                  case 3:
                                    iconData = Icons.remove;
                                    cardColor = Colors.red;
                                    break;
                                  default:
                                    iconData = Icons.attach_money;
                                    cardColor = Colors.yellow;
                                    break;
                                }

                                String? dateTime = _storage.read('trx_tanggal_$reversedIndex');
                                if (dateTime == null) {
                                  return SizedBox.shrink();
                                }
                                List<String> dateTimeParts = dateTime.split(' ');
                                String date = dateTimeParts[0];
                                String time = dateTimeParts.length > 1 ? dateTimeParts[1] : '';

                                return Card(
                                  color: cardColor,
                                  child: ListTile(
                                    leading: Icon(
                                      iconData,
                                      color: Colors.white,
                                    ),
                                    title: _storage.read('trx_id_$reversedIndex') == 1
                                        ? Text('Saldo Awal', style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                                        : _storage.read('trx_id_$reversedIndex') == 2
                                            ? Text('Simpanan', style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                                            : _storage.read('trx_id_$reversedIndex') == 3
                                                ? Text('Penarikan', style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                                                : Text('Bunga Simpanan', style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                      formatCurrency(_storage.read('trx_nominal_$reversedIndex') ?? 0),
                                      style: TextStyles.body.copyWith(color: Colors.white, fontSize: 12),
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          date,
                                          style: TextStyles.body.copyWith(color: Colors.white, fontSize: 12),
                                        ),
                                        Text(
                                          time,
                                          style: TextStyles.body.copyWith(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
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
