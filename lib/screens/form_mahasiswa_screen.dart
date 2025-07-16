// lib/screens/form_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mahasiswa_model.dart';
import '../providers/mahasiswa_provider.dart';

class FormMahasiswaScreen extends StatefulWidget {
  const FormMahasiswaScreen({super.key});

  @override
  State<FormMahasiswaScreen> createState() => _FormMahasiswaScreenState();
}

class _FormMahasiswaScreenState extends State<FormMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _jurusanController = TextEditingController();

  bool _isInit = true;
  bool _isEditing = false;
  String? _mahasiswaId;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final mhs = ModalRoute.of(context)!.settings.arguments as Mahasiswa?;
      if (mhs != null) {
        _isEditing = true;
        _mahasiswaId = mhs.id;
        _namaController.text = mhs.nama;
        _nimController.text = mhs.nim;
        _jurusanController.text = mhs.jurusan;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<MahasiswaProvider>(context, listen: false);
      if (_isEditing) {
        provider.updateMahasiswa(Mahasiswa(
          id: _mahasiswaId!,
          nama: _namaController.text,
          nim: _nimController.text,
          jurusan: _jurusanController.text,
        ));
      } else {
        provider.addMahasiswa(Mahasiswa(
          id: DateTime.now().toString(), // ID unik sederhana
          nama: _namaController.text,
          nim: _nimController.text,
          jurusan: _jurusanController.text,
        ));
      }
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Data berhasil ${_isEditing ? 'diperbarui' : 'disimpan'}!')),
      );
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _jurusanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Data Mahasiswa' : 'Input Data Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(labelText: 'NIM'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'NIM tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: _jurusanController,
                decoration: const InputDecoration(labelText: 'Jurusan'),
                validator: (value) =>
                    value!.isEmpty ? 'Jurusan tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: Text(_isEditing ? 'Update' : 'Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}