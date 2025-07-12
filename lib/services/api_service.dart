// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static Future<Map<String, dynamic>> fetchUsersWithMeta(int page) async {
    final String url = 'https://reqres.in/api/users?page=$page&per_page=10';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<dynamic> userListJson = body['data'];
        final int totalPages = body['total_pages'];
        return {
          'users': userListJson.map((json) => User.fromJson(json)).toList(),
          'totalPages': totalPages,
        };
      } else {
        throw Exception(
          'Failed to load users. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
