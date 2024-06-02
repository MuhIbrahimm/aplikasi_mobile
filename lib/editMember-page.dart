import 'package:flutter/material.dart';
import 'package:aplikasi_mobile/style.dart';
import 'package:aplikasi_mobile/api.dart';
import 'package:get_storage/get_storage.dart';

class EditMemberPage extends StatefulWidget {
  const EditMemberPage({super.key});

  @override
  State<EditMemberPage> createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  final _storage = GetStorage();

  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final tglLahirController = TextEditingController();
  final teleponController = TextEditingController();
  int statusAktif = 1;

  @override
  void initState() {
    super.initState();
    namaController.text = _storage.read('anggota_nama') ?? '';
    alamatController.text = _storage.read('anggota_alamat') ?? '';
    tglLahirController.text = _storage.read('anggota_tgl_lahir') ?? '';
    teleponController.text = _storage.read('anggota_telepon') ?? '';
    statusAktif = _storage.read('anggota_status_aktif') ?? 1;
  }

  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    tglLahirController.dispose();
    teleponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Member', style: TextStyles.h1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            formInput(
              'Name',
              namaController,
              _storage.read('anggota_nama'),
            ),
            formInput(
              'Address',
              alamatController,
              _storage.read('anggota_alamat'),
            ),
            formInput(
              'Date of Birth',
              tglLahirController,
              _storage.read('anggota_tgl_lahir'),
              isDatePicker: true,
            ),
            formInput(
              'Telephone',
              teleponController,
              _storage.read('anggota_telepon'),
            ),
            Text(
              'Status Aktif',
              style: TextStyles.body,
              textAlign: TextAlign.left,
            ),
            ListTile(
              title: Text('Aktif', style: TextStyles.body),
              leading: Radio<int>(
                value: 1,
                groupValue: statusAktif,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      statusAktif = value;
                    });
                  }
                },
              ),
            ),
            ListTile(
              title: Text('Nonaktif', style: TextStyles.body),
              leading: Radio<int>(
                value: 0,
                groupValue: statusAktif,
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      statusAktif = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                editAnggota(
                  context,
                  _storage.read('anggotaId'),
                  _storage.read('anggota_nomor_induk'),
                  teleponController.text,
                  statusAktif,
                  namaController.text,
                  alamatController.text,
                  tglLahirController.text,
                );
                Navigator.pushReplacementNamed(context, '/home');
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

Widget formInput(String label, TextEditingController controller, String initialValue, {bool isDatePicker = false}) {
  controller.text = initialValue;

  return Column(
    children: [
      Builder(
        builder: (BuildContext context) {
          return isDatePicker
              ? InkWell(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      controller.text = "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
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
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                )
              : TextField(
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
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                );
        },
      ),
      const SizedBox(
        height: 16.0,
      ),
    ],
  );
}
