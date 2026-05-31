import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/tambahjadwal.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  Future<void> _hapusJadwal(BuildContext context, String docId) async {
    try {
      await FirebaseFirestore.instance.collection('jadwal').doc(docId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Jadwal berhasil dihapus'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menghapus jadwal: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1C2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1C2E),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF4FC3F7)),
        title: const Text(
          'Jadwal KAI Antar Kota',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TambahJadwal()),
              );
            },
          ),
        ],
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('jadwal')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF4FC3F7),
              ),
            );
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada jadwal kereta.',
                style: TextStyle(
                  color: Color(0xFF8A9BB0),
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;

              final namaKereta = data['nama_kereta'] ?? '-';
              final keberangkatan = data['keberangkatan'] ?? '-';
              final tujuan = data['tujuan'] ?? '-';
              final dibuatOlehNama = data['dibuatOlehNama'] ?? '';
              final dibuatOlehEmail = data['dibuatOlehEmail'] ?? '';

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF152335),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF1E3A5F),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.train,
                      color: Color(0xFF4FC3F7),
                      size: 32,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            namaKereta,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            '$keberangkatan - $tujuan',
                            style: const TextStyle(
                              color: Color(0xFF8A9BB0),
                              fontSize: 14,
                            ),
                          ),

                          if (dibuatOlehNama.toString().isNotEmpty ||
                              dibuatOlehEmail.toString().isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Ditambahkan oleh: ${dibuatOlehNama.toString().isNotEmpty ? dibuatOlehNama : dibuatOlehEmail}',
                              style: const TextStyle(
                                color: Color(0xFF8A9BB0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    IconButton(
                      onPressed: () => _hapusJadwal(context, doc.id),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}