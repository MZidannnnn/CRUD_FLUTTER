// lib/screens/form_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // <-- 1. Import package intl
import '../models/mahasiswa_model.dart';
import '../providers/mahasiswa_provider.dart';

class FormMahasiswaScreen extends StatefulWidget {
  const FormMahasiswaScreen({super.key});

  @override
  State<FormMahasiswaScreen> createState() => _FormMahasiswaScreenState();
}

class _FormMahasiswaScreenState extends State<FormMahasiswaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomorController = TextEditingController();
  final _namaController = TextEditingController();
  final _tanggalLahirController = TextEditingController();
  final _jenisKelaminController = TextEditingController();
  final _alamatController = TextEditingController();

  bool _isInit = true;
  bool _isEditing = false;
  int? _originalNomor;

  // ... (didChangeDependencies tetap sama)
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final mhs = ModalRoute.of(context)!.settings.arguments as Mahasiswa?;
      if (mhs != null) {
        _isEditing = true;
        _originalNomor = mhs.nomor;
        _nomorController.text = mhs.nomor.toString();
        _namaController.text = mhs.nama;
        _tanggalLahirController.text = mhs.tanggalLahir;
        _jenisKelaminController.text = mhs.jenisKelamin;
        _alamatController.text = mhs.alamat;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // ... (_submitData tetap sama)
  void _submitData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final provider = Provider.of<MahasiswaProvider>(context, listen: false);
    final newData = Mahasiswa(
      nomor: int.parse(_nomorController.text),
      nama: _namaController.text,
      tanggalLahir: _tanggalLahirController.text,
      jenisKelamin: _jenisKelaminController.text,
      alamat: _alamatController.text,
    );
    bool isSuccess = false;
    if (_isEditing) {
      isSuccess = provider.updateMahasiswa(_originalNomor!, newData);
    } else {
      isSuccess = provider.addMahasiswa(newData);
    }
    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Data berhasil ${_isEditing ? 'diperbarui' : 'disimpan'}!',
          ),
        ),
      );
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Operasi gagal! Nomor sudah ada yang menggunakan.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // 2. Buat fungsi untuk menampilkan date picker
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950), // Batas tanggal paling awal
      lastDate: DateTime.now(), // Batas tanggal paling akhir
      locale: const Locale('id', 'ID'), // Menggunakan format bahasa Indonesia
    );

    if (picked != null) {
      setState(() {
        // Format tanggal dan set ke controller
        _tanggalLahirController.text = DateFormat(
          'dd MMMM yyyy',
          'id_ID',
        ).format(picked);
      });
    }
  }

  @override
  void dispose() {
    _nomorController.dispose();
    _namaController.dispose();
    _tanggalLahirController.dispose();
    _jenisKelaminController.dispose();
    _alamatController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? 'Edit Data' : 'Input Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                /* ... Nomor ... */
                controller: _nomorController,
                decoration: const InputDecoration(labelText: 'Nomor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Nomor tidak boleh kosong';
                  if (int.tryParse(value) == null)
                    return 'Input harus berupa angka';
                  return null;
                },
              ),
              TextFormField(
                /* ... Nama ... */
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),

              // 3. Ubah TextFormField Tanggal Lahir
              TextFormField(
                controller: _tanggalLahirController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                  ), // Tambah ikon kalender
                ),
                readOnly: true, // Buat agar tidak bisa diketik manual
                onTap: _selectDate, // Panggil fungsi _selectDate saat diklik
                validator:
                    (value) =>
                        value!.isEmpty
                            ? 'Tanggal Lahir tidak boleh kosong'
                            : null,
              ),

              TextFormField(
                /* ... Jenis Kelamin ... */
                controller: _jenisKelaminController,
                decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
                validator:
                    (value) =>
                        value!.isEmpty
                            ? 'Jenis Kelamin tidak boleh kosong'
                            : null,
              ),
              TextFormField(
                /* ... Alamat ... */
                controller: _alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
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
