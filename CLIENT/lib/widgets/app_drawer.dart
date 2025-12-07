import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.primaryBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.dashboard,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 12),
                Text(
                  "Menu Aplikasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ✅ Beranda Utama
          ListTile(
            leading: const Icon(Icons.dashboard, color: AppTheme.primaryBlue),
            title: const Text("Beranda"),
            onTap: () {
              context.pop();
              context.go('/');
            },
          ),

          const Divider(),

          // Section: Modul
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'MODUL',
              style: TextStyle(
                color: AppTheme.textGrey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // ✅ Pengajuan Surat
          ListTile(
            leading: const Icon(Icons.mail, color: AppTheme.primaryBlue),
            title: const Text("Pengajuan Surat"),
            onTap: () {
              context.pop();
              context.go('/letter-home');
            },
          ),

          // TODO: Salary Report (untuk kelompok lain)
          ListTile(
            leading: const Icon(Icons.attach_money, color: AppTheme.secondaryGreen),
            title: const Text("Salary Report"),
            onTap: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Modul Salary belum tersedia'),
                  backgroundColor: AppTheme.accentOrange,
                ),
              );
            },
          ),

          // TODO: Absensi (untuk kelompok lain)
          ListTile(
            leading: const Icon(Icons.calendar_today, color: AppTheme.accentOrange),
            title: const Text("Absensi"),
            onTap: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Modul Absensi belum tersedia'),
                  backgroundColor: AppTheme.accentOrange,
                ),
              );
            },
          ),

          const Divider(),

          // Section: Admin
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'ADMIN',
              style: TextStyle(
                color: AppTheme.textGrey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings, color: AppTheme.textGrey),
            title: const Text("Template Surat"),
            onTap: () {
              context.pop();
              context.go('/letters');
            },
          ),

          ListTile(
            leading: const Icon(Icons.assessment, color: AppTheme.accentPurple),
            title: const Text("Laporan Rekap"),
            onTap: () {
              context.pop();
              context.go('/employee-recap');
            },
          ),
        ],
      ),
    );
  }
}
