import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TambahJadwal extends StatefulWidget {
  const TambahJadwal({super.key});

  @override
  State<TambahJadwal> createState() => _TambahJadwalState();
}

class _TambahJadwalState extends State<TambahJadwal> {
  final _formKey = GlobalKey<FormState>();
  final _namaKeretaController = TextEditingController();
  final _keberangkatanController = TextEditingController();
  final _tujuanController = TextEditingController();

  bool isLoading = false;

  Future<void> _simpanJadwal() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection('jadwal').add({
        'nama_kereta': _namaKeretaController.text.trim(),
        'keberangkatan': _keberangkatanController.text.trim(),
        'tujuan': _tujuanController.text.trim(),
        'dibuatOlehUid': user?.uid ?? '',
        'dibuatOlehNama': user?.displayName ?? '',
        'dibuatOlehEmail': user?.email ?? '',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Jadwal berhasil disimpan ke Firestore'),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan jadwal: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _namaKeretaController.dispose();
    _keberangkatanController.dispose();
    _tujuanController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: iconColor),
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFF8A9BB0)),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF1E3A5F),
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF4FC3F7),
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1C2E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Tambah Jadwal",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F1C2E), Color(0xFF1E3A5F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _namaKeretaController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    icon: Icons.train,
                    iconColor: const Color(0xFF4FC3F7),
                    label: "Nama Kereta",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Kereta tidak boleh kosong';
                    } else if (value.length < 3) {
                      return 'Nama Kereta minimal 3 karakter';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _keberangkatanController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    icon: Icons.arrow_upward,
                    iconColor: Colors.red,
                    label: "Keberangkatan",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Keberangkatan tidak boleh kosong';
                    } else if (RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Keberangkatan tidak boleh mengandung angka';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _tujuanController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    icon: Icons.arrow_downward,
                    iconColor: Colors.green,
                    label: "Tujuan",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tujuan tidak boleh kosong';
                    } else if (RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Tujuan tidak boleh mengandung angka';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
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
                    onPressed: isLoading ? null : _simpanJadwal,
                    icon: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF0F1C2E),
                            ),
                          )
                        : const Icon(Icons.save),
                    label: Text(
                      isLoading ? 'Menyimpan...' : 'Simpan Jadwal',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}