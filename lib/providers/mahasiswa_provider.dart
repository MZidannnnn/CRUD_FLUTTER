// lib/providers/mahasiswa_provider.dart
import 'package:flutter/material.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaProvider with ChangeNotifier {
  final List<Mahasiswa> _mahasiswa = [
    // Data awal sebagai contoh
    Mahasiswa(
        id: '1',
        nama: 'Budi Santoso',
        nim: '11223344',
        jurusan: 'Teknik Informatika'),
    Mahasiswa(
        id: '2',
        nama: 'Ani Yudhoyono',
        nim: '55667788',
        jurusan: 'Sistem Informasi'),
  ];

  List<Mahasiswa> get mahasiswa => _mahasiswa;

  void addMahasiswa(Mahasiswa mhs) {
    _mahasiswa.add(mhs);
    notifyListeners(); // Memberi tahu widget yang mendengarkan bahwa ada perubahan
  }

  void updateMahasiswa(Mahasiswa mhs) {
    final index = _mahasiswa.indexWhere((item) => item.id == mhs.id);
    if (index != -1) {
      _mahasiswa[index] = mhs;
      notifyListeners();
    }
  }

  void deleteMahasiswa(String id) {
    _mahasiswa.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}