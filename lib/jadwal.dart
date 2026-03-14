import 'package:flutter/material.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal KAI Antar Kota'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent, // sama dengan warna tombol
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Pandanwangi - Ekonomi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Jember - Banyuwangi Kota', style: TextStyle(color: Colors.white)),
                Text('14.30 - 16.40', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mutiara Timur - Eksekutif', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Jember - Banyuwangi Kota', style: TextStyle(color: Colors.white)),
                Text('01.25 - 03.25', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Wijaya Kusuma - Ekonomi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Jember - Banyuwangi Kota', style: TextStyle(color: Colors.white)),
                Text('03.29 - 05.22', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Ijen Ekspress - Ekonomi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Jember - Banyuwangi Kota', style: TextStyle(color: Colors.white)),
                Text('12.32 - 14.40', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
