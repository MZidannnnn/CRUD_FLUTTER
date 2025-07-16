// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/mahasiswa_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/list_mahasiswa_screen.dart';
import 'screens/form_mahasiswa_screen.dart';
import 'screens/detail_mahasiswa_screen.dart';
import 'screens/informasi_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MahasiswaProvider(),
      child: MaterialApp(
        title: 'Aplikasi Kampusku',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        // Rute awal aplikasi adalah splash screen
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/dashboard': (context) => const DashboardScreen(),
          '/list_mahasiswa': (context) => const ListMahasiswaScreen(),
          '/form_mahasiswa': (context) => const FormMahasiswaScreen(),
          '/detail_mahasiswa': (context) => const DetailMahasiswaScreen(),
          '/informasi': (context) => const InformasiScreen(),
        },
      ),
    );
  }
}