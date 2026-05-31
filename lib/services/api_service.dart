import 'package:dio/dio.dart';
import '../models/users.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get("/users");

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => User.fromJson(e)).toList();
      } else {
        throw Exception("Gagal mengambil data users");
      }

    } on DioException catch (e) {
      throw Exception(_handleError(e));
    } catch (e) {
      throw Exception("Terjadi kesalahan: $e");
    }
  }

  Future<void> tambahUser(User user) async {
    try {
      final response = await dio.post(
        "/users",
        data: user.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return;
      } else {
        throw Exception("Gagal menambahkan user");
      }

    } on DioException catch (e) {
      throw Exception(_handleError(e));
    } catch (e) {
      throw Exception("Terjadi kesalahan: $e");
    }
  }

  String _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "Koneksi timeout";
      case DioExceptionType.sendTimeout:
        return "Timeout saat mengirim data";
      case DioExceptionType.receiveTimeout:
        return "Timeout saat menerima data";
      case DioExceptionType.badResponse:
        return "Server error: ${e.response?.statusCode}";
      case DioExceptionType.cancel:
        return "Request dibatalkan";
      case DioExceptionType.connectionError:
        return "Tidak ada koneksi internet";
      default:
        return "Terjadi kesalahan tidak diketahui";
    }
  }
}