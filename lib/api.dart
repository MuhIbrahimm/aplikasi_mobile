import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

final _dio = Dio();
final _storage = GetStorage();
final _apiUrl = 'https://mobileapis.manpits.xyz/api';

void register(name, email, password) async {
  try {
    final _register = await _dio.post(
      '${_apiUrl}/register',
      data: {'name': name, 'email': email, 'password': password},
    );
    final _login = await _dio.post(
      '${_apiUrl}/login',
      data: {'email': email, 'password': password},
    );
    _storage.write('token', _login.data['data']['token']);
    print(_register.data);
    print(_login.data);
    final _userInfo = await _dio.get(
      '${_apiUrl}/user',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('id', _userInfo.data['data']['user']['id']);
    _storage.write('email', _userInfo.data['data']['user']['email']);
    _storage.write('name', _userInfo.data['data']['user']['name']);
    print(_storage.read('id'));
    print(_storage.read('email'));
    print(_storage.read('name'));

  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
  
}

void login(email, password) async {
  try {
    final _response = await _dio.post(
      '${_apiUrl}/login',
      data: {
        'email': email,
        'password': password
      },
    );
    print(_response.data);
    _storage.write('token', _response.data['data']['token']);
    final _userInfo = await _dio.get(
      '${_apiUrl}/user',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('id', _userInfo.data['data']['user']['id']);
    _storage.write('email', _userInfo.data['data']['user']['email']);
    _storage.write('name', _userInfo.data['data']['user']['name']);
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void logout() async {
  try {
    final _response = await _dio.get(
      '${_apiUrl}/logout',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    print(_response.data);
    _storage.erase();
    } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

Future<void> getAnggota() async {
  try { 
    int count = 0;
    final _response = await _dio.get(
      '${_apiUrl}/anggota',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('anggotas', _response.data['data']['anggotas']);
    for (var anggota in _response.data['data']['anggotas']) {
      count += 1;

      _storage.write('id_${count}', anggota['id']);
      _storage.write('nomor_induk_${count}', anggota['nomor_induk']);
      _storage.write('telepon_${count}', anggota['telepon']);
      _storage.write('status_aktif_${count}', anggota['status_aktif']);
      _storage.write('nama_${count}', anggota['nama']);
      _storage.write('alamat_${count}', anggota['alamat']);
      _storage.write('tgl_lahir_${count}', anggota['tgl_lahir']);
      _storage.write('image_url_${count}', anggota['image_url']);
    }
    _storage.write('banyak_anggota', count);
    print('Jumlah Anggota: ${_storage.read('banyak_anggota')}');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void getAnggotaDetail(context, id) async {
  try {
    final _response = await _dio.get(
      '${_apiUrl}/anggota/${id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('anggotaId', _response.data['data']['anggota']['id']);
    _storage.write('anggota_nomor_induk',
        _response.data['data']['anggota']['nomor_induk']);
    _storage.write(
        'anggota_telepon', _response.data['data']['anggota']['telepon']);
    _storage.write('anggota_status_aktif',
        _response.data['data']['anggota']['status_aktif']);
    _storage.write('anggota_nama', _response.data['data']['anggota']['nama']);
    _storage.write(
        'anggota_alamat', _response.data['data']['anggota']['alamat']);
    _storage.write(
        'anggota_tgl_lahir', _response.data['data']['anggota']['tgl_lahir']);
    Navigator.pushNamed(context, '/detailMember');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void getEditAnggotaDetail(context, id) async {
  try {
    final _response = await _dio.get(
      '${_apiUrl}/anggota/${id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('anggotaId', _response.data['data']['anggota']['id']);
    _storage.write('anggota_nomor_induk', _response.data['data']['anggota']['nomor_induk']);
    _storage.write('anggota_telepon', _response.data['data']['anggota']['telepon']);
    _storage.write('anggota_status_aktif', _response.data['data']['anggota']['status_aktif']);
    _storage.write('anggota_nama', _response.data['data']['anggota']['nama']);
    _storage.write('anggota_alamat', _response.data['data']['anggota']['alamat']);
    _storage.write('anggota_tgl_lahir', _response.data['data']['anggota']['tgl_lahir']);
    Navigator.pushNamed(context, '/editMember');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void createAnggota(context, nomor_induk, telepon, status_aktif, nama, alamat,
    tgl_lahir) async {
  print('createAnggota');
  print('nomor_induk: ${nomor_induk}');
  print('telepon: ${telepon}');
  print('status_aktif: ${status_aktif}');
  print('nama: ${nama}');
  print('alamat: ${alamat}');
  print('tgl_lahir: ${tgl_lahir}');
  try {
    final _response = await _dio.post(
      '${_apiUrl}/anggota',
      data: {
        'nomor_induk': nomor_induk,
        'nama': nama,
        'alamat': alamat,
        'tgl_lahir': tgl_lahir,
        'telepon': telepon,
        'status_aktif': status_aktif,
      },
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    print(_response.data);
    Navigator.pushReplacementNamed(context, '/home');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void editAnggota(context, id, nomor_induk, telepon, status_aktif, nama, alamat,
    tgl_lahir) async {
  print('editAnggota');
  print('id: ${id}');
  print('nomor_induk: ${nomor_induk}');
  print('telepon: ${telepon}');
  print('status_aktif: ${status_aktif}');
  print('nama: ${nama}');
  print('alamat: ${alamat}');
  print('tgl_lahir: ${tgl_lahir}');
  try {
    final _response = await _dio.put(
      '${_apiUrl}/anggota/${id}',
      data: {
        'nomor_induk': nomor_induk,
        'nama': nama,
        'alamat': alamat,
        'tgl_lahir': tgl_lahir,
        'telepon': telepon,
        'status_aktif': status_aktif,
      },
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    print(_response.data);;
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void deleteAnggota(context, id) async {
  try {
    final _response = await _dio.delete(
      '${_apiUrl}/anggota/${id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    print(_response.data);
    Navigator.pushReplacementNamed(context, '/home');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void getSaldo(id) async {
  try {
    final _response = await _dio.get(
      '${_apiUrl}/saldo/${id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    _storage.write('saldo_${id}', _response.data['data']['saldo']);
    print(_storage.read('saldo_${id}'));
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void iterationSaldo() {
  for (var i = 0; i <= _storage.read('banyak_anggota'); i++) {
    getSaldo(_storage.read('id_${i}'));
  }
}

Future<void> getRiwayat(id) async {
  int count = 0;
  try {
    final _response = await _dio.get(
      '${_apiUrl}/tabungan/${id}',
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    for (var tabungan in _response.data['data']['tabungan']) {
      count += 1;

      _storage.write('id_${count}', tabungan['id']);
      _storage.write('trx_tanggal_${count}', tabungan['trx_tanggal']);
      _storage.write('trx_id_${count}', tabungan['trx_id']);
      _storage.write('trx_nominal_${count}', tabungan['trx_nominal']);
    }
    _storage.write('banyak_riwayat', count);
    print('Jumlah Riwayat Transaksi:  ${_storage.read('banyak_riwayat')}');
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

void addTabungan(
    String id, String trx_id, String trx_nominal, BuildContext context) async {
  try {
    final _response = await _dio.post(
      '${_apiUrl}/tabungan',
      data: {'anggota_id': id, 'trx_id': trx_id, 'trx_nominal': trx_nominal},
      options: Options(
        headers: {'Authorization': 'Bearer ${_storage.read('token')}'},
      ),
    );
    print(_response);
    _storage.remove('saldo_${id}');
    getSaldo(id);
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "/home");
  } on DioException catch (e) {
    print('error: ${e.response} - ${e.response?.statusCode}');
  }
}