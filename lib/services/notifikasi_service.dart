import 'dart:convert';
import 'package:http/http.dart' as http;

class NotifikasiService {
  static const String baseUrl = 'https://wadulguse-api.vercel.app';

  static Future<void> sendNotification({
    required int targetUserId,
    required String judul,
    required String pesan,
    int? laporanId,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/notifikasi/send'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'target_user_id': targetUserId,
        'judul': judul,
        'pesan': pesan,
        'laporan_id': laporanId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
  }
}