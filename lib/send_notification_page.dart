import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/services/notifikasi_service.dart';

class SendNotificationPage extends StatefulWidget {
  const SendNotificationPage({super.key});

  @override
  State<SendNotificationPage> createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<SendNotificationPage> {
  final targetUserIdController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  bool isLoading = false;

  Future<void> sendNotification() async {
    final targetUserIdText = targetUserIdController.text.trim();
    final judul = titleController.text.trim();
    final pesan = bodyController.text.trim();

    if (targetUserIdText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ID user tujuan wajib diisi'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final targetUserId = int.tryParse(targetUserIdText);

    if (targetUserId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ID user tujuan harus angka'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (pesan.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi pesan wajib diisi'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await NotifikasiService.sendNotification(
        targetUserId: targetUserId,
        judul: judul.isEmpty ? 'Notifikasi Baru' : judul,
        pesan: pesan,
        laporanId: null,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Push notification berhasil dikirim'),
          backgroundColor: Colors.green,
        ),
      );

      titleController.clear();
      bodyController.clear();
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengirim: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
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
    targetUserIdController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({
    required String label,
    required IconData icon,
    String? hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: Color(0xFF8A9BB0)),
      hintStyle: const TextStyle(color: Color(0xFF8A9BB0)),
      prefixIcon: Icon(icon, color: const Color(0xFF4FC3F7)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF1E3A5F)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF4FC3F7)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1C2E),
      appBar: AppBar(
        title: const Text('Kirim Push Notification'),
        backgroundColor: const Color(0xFF152335),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          color: const Color(0xFF152335),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: const BorderSide(color: Color(0xFF1E3A5F)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kirim Notifikasi ke User Tertentu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Masukkan ID user tujuan dari tabel users Supabase. Notifikasi hanya dikirim ke user tersebut.',
                  style: TextStyle(
                    color: Color(0xFF8A9BB0),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 24),

                TextField(
                  controller: targetUserIdController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    label: 'ID User Tujuan',
                    icon: Icons.person,
                    hint: 'Contoh: 4',
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    label: 'Judul Notifikasi',
                    icon: Icons.title,
                    hint: 'Contoh: Halo B',
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: bodyController,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.white),
                  decoration: inputDecoration(
                    label: 'Isi Pesan',
                    icon: Icons.message,
                    hint: 'Contoh: Ini notifikasi dari perangkat A',
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : sendNotification,
                    icon: isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF0F1C2E),
                            ),
                          )
                        : const Icon(Icons.send),
                    label: Text(
                      isLoading ? 'Mengirim...' : 'Kirim Notifikasi',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4FC3F7),
                      foregroundColor: const Color(0xFF0F1C2E),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
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