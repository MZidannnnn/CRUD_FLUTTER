// lib/providers/mahasiswa_provider.dart
import 'package:flutter/material.dart';
import '../models/mahasiswa_model.dart';

class MahasiswaProvider with ChangeNotifier {
  final List<Mahasiswa> _mahasiswa = [
    Mahasiswa(
      nomor: 202501001, // Ubah menjadi integer (tanpa tanda kutip)
      nama: 'Budi Hartono',
      tanggalLahir: '15 Januari 2003',
      jenisKelamin: 'Laki-laki',
      alamat: 'Jl. Merdeka No. 10, Jakarta',
    
    ),
    Mahasiswa(
      nomor: 202501002, // Ubah menjadi integer (tanpa tanda kutip)
      nama: 'Citra Lestari',
      tanggalLahir: '22 Februari 2004',
      jenisKelamin: 'Perempuan',
      alamat: 'Jl. Pahlawan No. 5, Bandung',
    
    ),
  ];

  List<Mahasiswa> get mahasiswa => _mahasiswa;

  bool addMahasiswa(Mahasiswa mhs) {
    if (_mahasiswa.any((item) => item.nomor == mhs.nomor)) {
      return false;
    }
    _mahasiswa.add(mhs);
    notifyListeners();
    return true;
  }

  // Ubah parameter oldNomor menjadi int
  bool updateMahasiswa(int oldNomor, Mahasiswa newMhs) {
    final index = _mahasiswa.indexWhere((item) => item.nomor == oldNomor);
    if (index != -1) {
      final isNomorChanged = oldNomor != newMhs.nomor;
      if (isNomorChanged && _mahasiswa.any((item) => item.nomor == newMhs.nomor)) {
        return false;
      }
      _mahasiswa[index] = newMhs;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Ubah parameter nomor menjadi int
  void deleteMahasiswa(int nomor) {
    _mahasiswa.removeWhere((item) => item.nomor == nomor);
    notifyListeners();
  }
}