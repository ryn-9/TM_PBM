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
      body: Column(
        children: [
          const Text('Lihat Jadwal'),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return Jadwal();
                }
              )
            );
          }, child: Text('Jadwal'))
        ],
      ),
    );
  }
}