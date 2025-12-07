import 'package:go_router/go_router.dart';
import '../features/home/screens/home_screen.dart';
import '../features/home/screens/letter_home_screen.dart';
import '../features/letter/screens/letter_list_screen.dart';
import '../features/letter/screens/letter_create_screen.dart';
import '../features/letter/screens/letter_detail_screen.dart';
import '../features/letter/screens/letter_template_form_screen.dart';
import '../features/letter/models/letter_format.dart';
import '../features/letter/screens/employee_recap_page.dart';

import '../features/form/screen/form_surat_page.dart';
import '../features/form/screen/hrd_list_page.dart';
import '../features/form/screen/hrd_detail_page.dart';

// ✅ Uncomment ini saat sudah ada halaman login
// import '../features/auth/screens/login_screen.dart';

class AppRoutes {
  static const formSurat = "/form-surat";
  static const hrdList = "/hrd-list";
  static const detailSurat = "/detail-surat";
  static const letterHome = "/letter-home";
  static const employeeRecap = "/employee-recap"; // ✅ TAMBAH INI
  // ✅ SLOT UNTUK LOGIN (Uncomment saat sudah siap)
  // static const login = "/login";
}

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ============================
    // AUTH ROUTES (UNCOMMENT SAAT SUDAH ADA FITUR LOGIN)
    // ============================
    // GoRoute(
    //   path: AppRoutes.login,
    //   builder: (context, state) => const LoginScreen(),
    // ),

    // ============================
    // HOME
    // ============================
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    // ✅ HOME KHUSUS LETTER (untuk avoid conflict saat merge)
    GoRoute(
      path: AppRoutes.letterHome,
      builder: (context, state) => const LetterHomeScreen(),
    ),

    // ============================
    // KARYAWAN ROUTES
    // ============================
    // Form Surat - KARYAWAN mengajukan surat
    GoRoute(
      path: AppRoutes.formSurat,
      builder: (context, state) => const FormSuratPage(),
    ),

    // ============================
    // HRD ROUTES
    // ============================
    // HRD List - HRD melihat daftar pengajuan
    GoRoute(
      path: AppRoutes.hrdList,
      builder: (context, state) => const HrdListPage(),
    ),

    // Detail Surat - HRD melihat detail pengajuan
    GoRoute(
      path: AppRoutes.detailSurat,
      builder: (context, state) =>
          HrdDetailPage(surat: state.extra as Map<String, dynamic>),
    ),

    // ============================
    // ADMIN ROUTES - Letter Template Management
    // ============================
    // List template
    GoRoute(
      path: '/letters',
      builder: (context, state) => const LettersListScreen(),
    ),

    // Create template baru
    GoRoute(
      path: '/letter/template/create',
      builder: (context, state) => const LetterTemplateFormScreen(),
    ),

    // Edit template
    GoRoute(
      path: '/letter/template/edit',
      builder: (context, state) {
        final template = state.extra as LetterFormat;
        return LetterTemplateFormScreen(template: template);
      },
    ),

    // Generate surat dari template
    GoRoute(
      path: '/letter/create',
      builder: (context, state) {
        final extra = state.extra as LetterFormat;
        return LetterCreateScreen(jenisSurat: extra);
      },
    ),

    // Letter Detail
    GoRoute(
      path: '/letter/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return LetterDetailScreen(id: id);
      },
    ),

    // ============================
    // LAPORAN
    // ============================
    // Laporan Rekap Karyawan
    GoRoute(
      path: AppRoutes.employeeRecap, // ✅ Gunakan constant
      builder: (context, state) => const EmployeeRecapPage(),
    ),
  ],

  // ✅ REDIRECT KE LOGIN JIKA BELUM AUTH (Uncomment saat sudah ada login)
  // redirect: (context, state) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //   
  //   final isLoggingIn = state.location == AppRoutes.login;
  //   
  //   if (token == null) {
  //     return isLoggingIn ? null : AppRoutes.login;
  //   }
  //   
  //   if (isLoggingIn) {
  //     return '/';
  //   }
  //   
  //   return null;
  // },
);
