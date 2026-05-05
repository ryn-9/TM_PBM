import 'package:dio/dio.dart';
import '../models/users.dart'; // supaya bisa pakai class User

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));

  // GET semua users
  Future<List<User>> getUsers() async {
    final response = await dio.get("/users");
    if (response.statusCode == 200) {
      final List data = response.data;
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception("Gagal ambil users");
    }
  }

  // POST tambah user
  Future<void> tambahUser(User user) async {
    await dio.post("/users", data: {
      "name": user.name,
      "username": user.username,
      "password": user.password,
      "city": user.city,
    });
  }
}
