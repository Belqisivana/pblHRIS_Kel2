import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/employee_recap.dart';

class EmployeeRecapService {
  static Future<List<EmployeeRecap>> fetchEmployeeRecap() async {
    try {
      print('🔄 Fetching employee recap...');
      
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/employee-recap'),
      );
      
      print('📡 Response status: ${response.statusCode}');
      print('📦 Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // ✅ Check response structure
        if (data is Map && data.containsKey('data')) {
          final List list = data['data'];
          print('✅ Found ${list.length} employees');
          
          // Debug: Print first employee if exists
          if (list.isNotEmpty) {
            print('📋 Sample employee: ${list.first}');
          }
          
          return list.map((e) => EmployeeRecap.fromJson(e)).toList();
        } else {
          throw Exception('Invalid response structure');
        }
      } else {
        throw Exception('Failed to load employee recap: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Error in fetchEmployeeRecap: $e');
      rethrow;
    }
  }
}
