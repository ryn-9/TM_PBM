import 'package:flutter/material.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

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
      ),  // ← AppBar ditutup di sini
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pandanwangi - Ekonomi',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Jember - Banyuwangi Kota',
                      style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
                  SizedBox(height: 2),
                  Text('14.30 - 16.40',
                      style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Mutiara Timur - Eksekutif',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Jember - Banyuwangi Kota',
                      style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
                  SizedBox(height: 2),
                  Text('01.25 - 03.25',
                      style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Wijaya Kusuma - Ekonomi',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Jember - Banyuwangi Kota',
                      style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
                  SizedBox(height: 2),
                  Text('03.29 - 05.22',
                      style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF152335),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF1E3A5F), width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Ijen Ekspress - Ekonomi',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Jember - Banyuwangi Kota',
                      style: TextStyle(color: Color(0xFF8A9BB0), fontSize: 12)),
                  SizedBox(height: 2),
                  Text('12.32 - 14.40',
                      style: TextStyle(color: Color(0xFF4FC3F7), fontWeight: FontWeight.w600, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}