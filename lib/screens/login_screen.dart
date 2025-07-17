// lib/screens/login_screen.dart
import 'package:flutter/material.dart';


class User {
  final String email;
  final String password;

  User(this.email, this.password);
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  
  final List<User> _users = [
    User('admin@gmail.com', '123'),
    User('poliban', '0000'),
  ];

  
  void _login() {
    if (_formKey.currentState!.validate()) {
      final inputEmail = _emailController.text;
      final inputPassword = _passwordController.text;

      bool loginSuccess = false;

      // Loop melalui setiap user di dalam list
      for (var user in _users) {
        if (user.email == inputEmail && user.password == inputPassword) {
          loginSuccess = true;
          break; // Hentikan loop jika user yang cocok ditemukan
        }
      }

      if (loginSuccess) {
        // Jika berhasil, navigasi ke dashboard
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        // Jika tidak ada user yang cocok, tampilkan pesan error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email atau password salah!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      // Ubah body menjadi Stack untuk menumpuk widget
      body: Stack(
        children: [
          // 1. Konten form yang sudah ada
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, size: 80, color: Colors.indigo),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Email tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.key),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Password tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // 2. Widget untuk watermark
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Created by Muhammad Zidan Helmy', // Ganti dengan nama Anda
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}