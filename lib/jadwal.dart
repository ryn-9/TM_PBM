import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/tambahjadwal.dart';

class Kereta {
  final String nama_kereta;
  final String keberangkatan;
  final String tujuan;

  Kereta({
    required this.nama_kereta,
    required this.keberangkatan,
    required this.tujuan,
  });
}

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  final List<Kereta> jadwalKereta = [
    Kereta(nama_kereta: 'Pandanwangi', keberangkatan: 'Jember', tujuan: 'Banyuwangi Kota'),
    Kereta(nama_kereta: 'Mutiara Timur', keberangkatan: 'Jember', tujuan: 'Banyuwangi Kota'),
  ];

  void _tambahJadwal(Kereta keretaBaru) {
    setState(() {
      jadwalKereta.add(keretaBaru);
    });
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
            onPressed: () async {
              final hasil = await Navigator.push<Kereta>(
                context,
                MaterialPageRoute(builder: (_) => const TambahJadwal()),
              );
              if (hasil != null) {
                _tambahJadwal(hasil);
              }
            },
          )
        ],
      ),  // ← AppBar ditutup di sini
      body: ListView.builder(
        itemCount: jadwalKereta.length,
        itemBuilder: (context, index){
          final kereta = jadwalKereta[index];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(kereta.nama_kereta,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('${kereta.keberangkatan} - ${kereta.tujuan}', style: const TextStyle(color: Color(0xFF8A9BB0))),                
                ],
              ),
            ),
          );
        })
      // Padding(
      //   padding: const EdgeInsets.all(12),
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: const Color(0xFF152335),
      //           borderRadius: BorderRadius.circular(16),
      //           border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: const [
      //             Text('Pandanwangi - Ekonomi',
      //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
      //             SizedBox(height: 4),
      //             Text('Jember - Banyuwangi Kota',
      //                 style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
      //             SizedBox(height: 2),
      //             Text('14.30 - 16.40',
      //                 style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: const Color(0xFF152335),
      //           borderRadius: BorderRadius.circular(16),
      //           border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: const [
      //             Text('Mutiara Timur - Eksekutif',
      //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
      //             SizedBox(height: 4),
      //             Text('Jember - Banyuwangi Kota',
      //                 style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
      //             SizedBox(height: 2),
      //             Text('01.25 - 03.25',
      //                 style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: const Color(0xFF152335),
      //           borderRadius: BorderRadius.circular(16),
      //           border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: const [
      //             Text('Wijaya Kusuma - Ekonomi',
      //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
      //             SizedBox(height: 4),
      //             Text('Jember - Banyuwangi Kota',
      //                 style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
      //             SizedBox(height: 2),
      //             Text('03.29 - 05.22',
      //                 style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 10),
      //       Container(
      //         width: double.infinity,
      //         padding: const EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: const Color(0xFF152335),
      //           borderRadius: BorderRadius.circular(16),
      //           border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: const [
      //             Text('Ijen Ekspress - Ekonomi',
      //                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
      //             SizedBox(height: 4),
      //             Text('Jember - Banyuwangi Kota',
      //                 style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
      //             SizedBox(height: 2),
      //             Text('12.32 - 14.40',
      //                 style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}