// lib/models/mahasiswa_model.dart
class Mahasiswa {
  int nomor; // Diubah dari String ke int
  String nama;
  String tanggalLahir;
  String jenisKelamin;
  String alamat;
 

  Mahasiswa({
    required this.nomor,
    required this.nama,
    required this.tanggalLahir,
    required this.jenisKelamin,
    required this.alamat,
    
  });
}