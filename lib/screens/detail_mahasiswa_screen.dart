// lib/screens/detail_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import '../models/mahasiswa_model.dart';

class DetailMahasiswaScreen extends StatelessWidget {
  const DetailMahasiswaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mhs = ModalRoute.of(context)!.settings.arguments as Mahasiswa;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${mhs.nama}'),
      ),
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
                  leading: const Icon(Icons.person, color: Colors.indigo),
                  title: const Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(mhs.nama, style: const TextStyle(fontSize: 16)),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.numbers, color: Colors.indigo),
                  title: const Text('NIM', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(mhs.nim, style: const TextStyle(fontSize: 16)),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.school, color: Colors.indigo),
                  title: const Text('Jurusan', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(mhs.jurusan, style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}