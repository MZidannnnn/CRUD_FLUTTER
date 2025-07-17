// lib/screens/detail_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import '../models/mahasiswa_model.dart';

class DetailMahasiswaScreen extends StatelessWidget {
  const DetailMahasiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mhs = ModalRoute.of(context)!.settings.arguments as Mahasiswa;

    return Scaffold(
      appBar: AppBar(title: Text('Detail ${mhs.nama}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.confirmation_number,
                    color: Colors.indigo,
                  ),
                  title: const Text(
                    'Nomor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mhs.nomor.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.indigo),
                  title: const Text(
                    'Nama Lengkap',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mhs.nama,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    color: Colors.indigo,
                  ),
                  title: const Text(
                    'Tanggal Lahir',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mhs.tanggalLahir,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.wc, color: Colors.indigo),
                  title: const Text(
                    'Jenis Kelamin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mhs.jenisKelamin,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.indigo),
                  title: const Text(
                    'Alamat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    mhs.alamat,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Created by Muhammad Zidan Helmy', // Ganti dengan nama Anda
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
