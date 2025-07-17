// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // <-- 1. Tambah import ini


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

                // 2. Tambahkan konfigurasi lokalisasi di sini
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'), // Bahasa Indonesia
          Locale('en', 'US'), // Bahasa Inggris sebagai fallback
        ],

  

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