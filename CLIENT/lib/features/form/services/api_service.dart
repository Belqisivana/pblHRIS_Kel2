import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseURL = "http://127.0.0.1:8000/api";

  // ============================
  // TOKEN
  // ============================
  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  //(DENGAN FITUR LOGIN YANG MENYIMPAN TOKEN)
  // static Future<Map<String, String>> _headersWithToken() async {
  //   final token = await _getToken();

  //   return {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     if (token != null) 'Authorization': 'Bearer $token',
  //   };
  // }
  //(INI BUAT TESTING TANPA LOGIN)
  static Future<Map<String, String>> _headersWithToken() async {
    const token = "1|C6BP43cTuta6dAwaKvVosL1rREehAVI6Cruh0J3jbdd82338";

    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  // ============================
  // GET PROFILE (employeeinfo)
  // ============================
  static Future<Map<String, dynamic>?> fetchProfile() async {
    try {
      final response = await http.get(
        Uri.parse('$baseURL/letter/employee'),
        headers: await _headersWithToken(),
      );

      print("Profile Status: ${response.statusCode}");
      print("Profile Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      print("Profile Exception: $e");
      return null;
    }
  }

  // ============================
  // CREATE SURAT (PENGAJUAN SURAT)
  // ============================
  static Future<bool> createPengajuanSurat(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/letters/submit'),
        headers: await _headersWithToken(),
        body: jsonEncode(data),
      );

      print("Submit Letter Status: ${response.statusCode}");
      print("Submit Letter Body: ${response.body}");

      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print("Submit Letter Exception: $e");
      return false;
    }
  }

  // ============================
  // CREATE SURAT (DARI VERSI LAMA)
  // ============================
  // static Future<bool> createSurat(Map data) async {
  //   try {
  //     final res = await http.post(
  //       Uri.parse("$baseURL/letters"),
  //       headers: await _headersWithToken(),
  //       body: jsonEncode(data),
  //     );

  //     print('Create Letter Status: ${res.statusCode}');
  //     print('Create Letter Response: ${res.body}');

  //     return res.statusCode == 200 || res.statusCode == 201;
  //   } catch (e) {
  //     print('Create Letter Exception: $e');
  //     return false;
  //   }
  // }

  // ============================
  // GET LIST SURAT
  // ============================
  static Future<List> getSurat() async {
    try {
      final res = await http.get(
        Uri.parse("$baseURL/letters"),
        headers: await _headersWithToken(),
      );

      print("Get Letters Status: ${res.statusCode}");

      if (res.statusCode == 200) {
        final decode = jsonDecode(res.body);

        if (decode is Map && decode.containsKey('data')) {
          return decode['data'];
        }

        if (decode is List) {
          return decode;
        }
      }
      return [];
    } catch (e) {
      print('Get Letters Exception: $e');
      return [];
    }
  }

  // ============================
  // UPDATE STATUS SURAT
  // ============================
  static Future<bool> updateStatus(dynamic id, String status) async {
    try {
      final res = await http.put(
        Uri.parse("$baseURL/letters/$id/status"),
        headers: await _headersWithToken(),
        body: jsonEncode({"status": status}),
      );

      print('Update Status: ${res.statusCode}');
      print('Update Response: ${res.body}');

      return res.statusCode == 200;
    } catch (e) {
      print('Update Status Exception: $e');
      return false;
    }
  }
}
