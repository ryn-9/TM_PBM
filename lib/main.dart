import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas_pbm_tm/jadwal.dart';


import 'firebase_options.dart';
import 'package:tugas_pbm_tm/home.dart';
import 'package:tugas_pbm_tm/jadwal.dart';
import 'package:tugas_pbm_tm/login.dart';
import 'package:tugas_pbm_tm/tambahjadwal.dart';
import 'package:tugas_pbm_tm/tambahuser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TM PBM Firebase',
      debugShowCheckedModeBanner: false,

      // AuthGate akan menentukan halaman awal:
      // kalau sudah login → HomeScreen
      // kalau belum login → LoginScreen
      home: const AuthGate(),

      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/jadwal': (context) => Jadwal(),
        '/tambah_jadwal': (context) => TambahJadwal(),
        '/tambahUser': (context) => TambahUser(),
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Saat Firebase sedang cek status login
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Kalau user sudah login Google
        if (snapshot.hasData) {
          return HomeScreen();
        }

        // Kalau user belum login
        return LoginScreen();
      },
    );
  }
}