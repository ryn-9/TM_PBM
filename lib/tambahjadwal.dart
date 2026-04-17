import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/jadwal.dart';

class TambahJadwal extends StatefulWidget {
  const TambahJadwal({super.key});

  @override
  State<TambahJadwal> createState() => _TambahJadwalState();
}

class _TambahJadwalState extends State<TambahJadwal> {
  final _formKey = GlobalKey<FormState>();
  final _nama_keretaController = TextEditingController();
  final _keberangkatanController = TextEditingController();
  final _tujuanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Tambah Jadwal", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F1C2E), Color(0xFF1E3A5F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey, 
            child: Column(
              children: [
                TextFormField(
                  controller: _nama_keretaController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.train, color: Color(0xFF4FC3F7)),
                    labelText: "Nama Kereta",
                    labelStyle: const TextStyle(color: Color(0xFF8A9BB0)),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF4FC3F7), width: 1.5),
                        ),
                    ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Kereta tidak boleh kosong';
                          }
                          else if (value.length < 3) {
                            return 'Nama Kereta minimal 3 karakter';
                          }
                          return null;
                        },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _keberangkatanController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.arrow_upward, color: Colors.red),
                    labelText: "Keberangkatan",
                    labelStyle: const TextStyle(color: Color(0xFF8A9BB0)),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF4FC3F7), width: 1.5),
                        ),
                    ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Keberangkatan tidak boleh kosong';
                          }
                          else if (RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Keberangkatan tidak boleh mengandung angka';
                          }
                          return null;
                        },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _tujuanController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.arrow_downward, color: Colors.green),
                    labelText: "Tujuan",
                    labelStyle: const TextStyle(color: Color(0xFF8A9BB0)),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF4FC3F7), width: 1.5),
                        ),
                    ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Tujuan tidak boleh kosong';
                          }
                          else if (RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Tujuan tidak boleh mengandung angka';
                          }
                          return null;
                        },
                ),
                
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4FC3F7),
                        foregroundColor: const Color(0xFF0F1C2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 28,
                        ),
                        elevation: 8,
                      ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final keretaBaru = Kereta(
                        nama_kereta: _nama_keretaController.text,
                        keberangkatan: _keberangkatanController.text,
                        tujuan: _tujuanController.text,                    
                      );
                      Navigator.pop(context, keretaBaru);
                    }
                  },
                  child: const Text('Simpan Jadwal'),
                )
              ],
            ),
          ),),
      ),
    );
  }
}