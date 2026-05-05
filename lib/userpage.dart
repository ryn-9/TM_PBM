import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'models/users.dart';
import 'tambahUser.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];
  final api = ApiService();

  bool isLoading = false;
  String error = '';

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      isLoading = true;
      error = '';
    });

    try {
      final data = await api.getUsers();
      setState(() {
        users = data;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  void _tambahUser(User userBaru) async {
    try {
      await api.tambahUser(userBaru);

      // karena API fake → tambahkan manual ke list
      setState(() {
        users.add(userBaru);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User berhasil ditambahkan")),
      );
    } catch (e) {
      print("Error POST user: $e");
    }
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
          'Daftar Users',
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
              final hasil = await Navigator.push<User>(
                context,
                MaterialPageRoute(builder: (_) => const TambahUser()),
              );

              if (hasil != null) {
                _tambahUser(hasil);
              }
            },
          )
        ],
      ),

      // 🔥 BODY
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(
                  child: Text(
                    error,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadUsers,
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];

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
                                user.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@${user.username}',
                                style: const TextStyle(
                                  color: Color(0xFF8A9BB0),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Kota: ${user.city}',
                                style: const TextStyle(
                                  color: Color(0xFF4FC3F7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}