import 'package:flutter/material.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal'),
      ),
      body: Column(
        children: [
          const Text('Jember - Banyuwangi'),
          const Text('07.00 - 21.00'),
          // ElevatedButton(
          //   onPressed: handleBtnTombol,
          //   child: const Text('Tombol'),
          // ),
        ],
      ),
    );
  }
}