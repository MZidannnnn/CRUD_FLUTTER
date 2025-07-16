// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _buildMenuCard(
      BuildContext context, IconData icon, String title, String routeName) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.indigo),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(context, Icons.list_alt, 'Lihat Data Mahasiswa',
                '/list_mahasiswa'),
            _buildMenuCard(
                context, Icons.add, 'Input Data Baru', '/form_mahasiswa'),
            _buildMenuCard(
                context, Icons.info, 'Informasi Aplikasi', '/informasi'),
          ],
        ),
      ),
    );
  }
}