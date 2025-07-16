// lib/screens/informasi_screen.dart
import 'package:flutter/material.dart';

class InformasiScreen extends StatelessWidget {
  const InformasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Aplikasi'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline, size: 80, color: Colors.indigo),
              SizedBox(height: 20),
              Text(
                'Aplikasi Kampusku v1.0',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Ini adalah aplikasi sederhana untuk mengelola data mahasiswa. Aplikasi ini dibuat untuk memenuhi tugas sebagai Junior Mobile Programmer. Fitur meliputi login, tambah, lihat, edit, dan hapus data.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}