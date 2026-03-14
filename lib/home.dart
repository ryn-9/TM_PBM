import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/jadwal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Selamat Datang di Aplikasi KAI',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) => const Jadwal()),
                    );
                  },
                  child: const Text('Lihat Jadwal'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
