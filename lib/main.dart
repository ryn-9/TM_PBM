import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'package:tugas_pbm_tm/home.dart';
import 'package:tugas_pbm_tm/jadwal.dart';
import 'package:tugas_pbm_tm/login.dart';
import 'package:tugas_pbm_tm/tambahjadwal.dart';
import 'package:tugas_pbm_tm/tambahuser.dart';
import 'package:tugas_pbm_tm/send_notification_page.dart';
import 'package:tugas_pbm_tm/services/notification_receiver_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Ini hanya untuk setup agar aplikasi bisa menerima notifikasi
  await NotificationReceiverService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TM PBM Firebase',
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/jadwal': (context) => const Jadwal(),
        '/tambah_jadwal': (context) => const TambahJadwal(),
        '/tambahUser': (context) => const TambahUser(),
        '/send-notification': (context) => const SendNotificationPage(),
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        return const LoginScreen();
      },
    );
  }
}