import 'package:flutter/material.dart';
import '../models/employee_recap.dart';
import '../services/employee_recap_service.dart';

class EmployeeRecapController extends ChangeNotifier {
  List<EmployeeRecap> employees = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchEmployeeRecap() async {
    try {
      print('🔄 Starting fetchEmployeeRecap...');
      isLoading = true;
      error = null;
      notifyListeners();

      employees = await EmployeeRecapService.fetchEmployeeRecap();
      
      print('✅ Loaded ${employees.length} employees');
      isLoading = false;
      notifyListeners();
      
    } catch (e) {
      print('❌ Error in controller: $e');
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
