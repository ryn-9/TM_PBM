import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class FcmApiService {
  static const String baseUrl = 'https://wadulguse-api.vercel.app';

  static Future<void> saveToken() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;

    await http.post(
      Uri.parse('$baseUrl/api/devices/register-token'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'firebase_uid': user.uid,
        'email': user.email,
        'name': user.displayName,
        'fcm_token': token,
      }),
    );

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      await http.post(
        Uri.parse('$baseUrl/api/devices/register-token'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'firebase_uid': user.uid,
          'email': user.email,
          'name': user.displayName,
          'fcm_token': newToken,
        }),
      );
    });
  }
}