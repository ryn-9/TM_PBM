import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/tambahjadwal.dart';
import 'services/api_service.dart';

class Kereta {
  final String nama_kereta;
  final String keberangkatan;
  final String tujuan;

  Kereta({
    required this.nama_kereta,
    required this.keberangkatan,
    required this.tujuan,
  });

  factory Kereta.fromJson(Map<String, dynamic> json) {
    return Kereta(
      nama_kereta: json['nama_kereta'],
      keberangkatan: json['keberangkatan'],
      tujuan: json['tujuan'],
    );
  }
}

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  List<Kereta> jadwalKereta = [];
  final api = ApiService();

//   @override
//   void initState() {
//     super.initState();
//     _loadJadwal(); // GET data saat halaman dibuka
//   }

  // Future<void> _loadJadwal() async {
  //   try {
  //     final data = await api.getJadwal();
  //     setState(() {
  //       jadwalKereta = data;
  //     });
  //   } catch (e) {
  //     print("Error GET jadwal: $e");
  //   }
  // }

  // void _tambahJadwal(Kereta keretaBaru) async {
  //   try {
  //     await api.tambahJadwal(keretaBaru); // POST ke API
  //     setState(() {
  //       jadwalKereta.add(keretaBaru);
  //     });
  //   } catch (e) {
  //     print("Error POST jadwal: $e");
  //   }
  // }

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
            onPressed: () async {
              final hasil = await Navigator.push<Kereta>(
                context,
                MaterialPageRoute(builder: (_) => const TambahJadwal()),
              );
              // if (hasil != null) {
              //   _tambahJadwal(hasil);
              // }
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: jadwalKereta.length,
        itemBuilder: (context, index) {
          final kereta = jadwalKereta[index];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kereta.nama_kereta,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${kereta.keberangkatan} - ${kereta.tujuan}',
                    style: const TextStyle(color: Color(0xFF8A9BB0)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
