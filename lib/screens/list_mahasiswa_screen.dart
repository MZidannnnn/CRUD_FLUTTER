// lib/screens/list_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/mahasiswa_provider.dart';
import '../models/mahasiswa_model.dart';

class ListMahasiswaScreen extends StatelessWidget {
  const ListMahasiswaScreen({super.key});

  void _showOptionsDialog(BuildContext context, Mahasiswa mhs) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pilih Aksi'),
        content: Text('Apa yang ingin Anda lakukan dengan data ${mhs.nama}?'),
        actions: [
          TextButton(
            child: const Text('Lihat Data'),
            onPressed: () {
              Navigator.of(ctx).pop(); // Tutup dialog
              Navigator.pushNamed(context, '/detail_mahasiswa', arguments: mhs);
            },
          ),
          TextButton(
            child: const Text('Update Data'),
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.pushNamed(context, '/form_mahasiswa', arguments: mhs);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus Data'),
            onPressed: () {
              // Mengirim 'mhs.nomor' sebagai kunci unik untuk menghapus
              Provider.of<MahasiswaProvider>(context, listen: false)
                  .deleteMahasiswa(mhs.nomor);
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data berhasil dihapus!')),
              );
            },
          ),
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
      ),
      body: Consumer<MahasiswaProvider>(
        builder: (context, provider, child) {
          if (provider.mahasiswa.isEmpty) {
            return const Center(child: Text('Tidak ada data mahasiswa.'));
          }
          return ListView.builder(
            itemCount: provider.mahasiswa.length,
            itemBuilder: (context, index) {
              final mhs = provider.mahasiswa[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text(mhs.nama.substring(0, 1))),
                  title: Text(mhs.nama),
                  // Menampilkan 'nomor' sebagai subtitle
                  subtitle: Text(mhs.nomor.toString()),
                  onTap: () => _showOptionsDialog(context, mhs),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/form_mahasiswa'),
        child: const Icon(Icons.add),
        tooltip: 'Input Data',
      ),
    );
  }
}