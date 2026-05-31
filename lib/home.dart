import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_pbm_tm/services/auth_service.dart';
import 'package:tugas_pbm_tm/userpage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _logout() async {
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F1C2E), Color(0xFF1E3A5F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 12,
                color: const Color(0xFF152335),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                  side: const BorderSide(
                    color: Color(0xFF1E3A5F),
                    width: 1.5,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: _logout,
                          icon: const Icon(
                            Icons.logout,
                            color: Color(0xFF8A9BB0),
                          ),
                          tooltip: 'Logout',
                        ),
                      ),

                      CircleAvatar(
                        radius: 46,
                        backgroundColor: const Color(0xFF1E3A5F),
                        backgroundImage: user?.photoURL != null
                            ? NetworkImage(user!.photoURL!)
                            : null,
                        child: user?.photoURL == null
                            ? const Icon(
                                Icons.person,
                                size: 54,
                                color: Color(0xFF4FC3F7),
                              )
                            : null,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Selamat Datang di Aplikasi KAI',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        user?.displayName ?? 'Pengguna Google',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4FC3F7),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        user?.email ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8A9BB0),
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 32),

                      _menuButton(
                        context: context,
                        icon: Icons.people,
                        label: 'Lihat Users',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => const UsersPage(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      _menuButton(
                        context: context,
                        icon: Icons.sync,
                        label: 'Uji Realtime Jadwal',
                        onPressed: () {
                          Navigator.pushNamed(context, '/jadwal');
                        },
                      ),

                      const SizedBox(height: 16),

                      _menuButton(
                        context: context,
                        icon: Icons.notifications_active,
                        label: 'Kirim Push Notification',
                        onPressed: () {
                          Navigator.pushNamed(context, '/send-notification');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4FC3F7),
          foregroundColor: const Color(0xFF0F1C2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          elevation: 6,
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 24),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}