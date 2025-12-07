import 'package:flutter/material.dart';
import '../../../widgets/app_drawer.dart';
import '../../../theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Header Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 80,
                    color: AppTheme.primaryBlue,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Dashboard Aplikasi',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pilih Modul yang Ingin Diakses',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Section Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Modul Aplikasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textDark,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Module Cards
            _buildModuleCard(
              context,
              icon: Icons.mail_outline,
              title: 'Pengajuan Surat',
              subtitle: 'Kelola pengajuan surat karyawan',
              color: AppTheme.primaryBlue,
              onTap: () => context.go('/letter-home'),
            ),
            
            const SizedBox(height: 16),
            
            _buildModuleCard(
              context,
              icon: Icons.attach_money,
              title: 'Salary Report',
              subtitle: 'Laporan gaji dan overtime',
              color: AppTheme.secondaryGreen,
              onTap: () {
                // TODO: Navigate to Salary module
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Modul Salary belum tersedia'),
                    backgroundColor: AppTheme.accentOrange,
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            _buildModuleCard(
              context,
              icon: Icons.calendar_today,
              title: 'Absensi',
              subtitle: 'Kelola kehadiran karyawan',
              color: AppTheme.accentOrange,
              onTap: () {
                // TODO: Navigate to Attendance module
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Modul Absensi belum tersedia'),
                    backgroundColor: AppTheme.accentOrange,
                  ),
                );
              },
            ),
            
            const SizedBox(height: 16),
            
            _buildModuleCard(
              context,
              icon: Icons.people,
              title: 'Karyawan',
              subtitle: 'Manajemen data karyawan',
              color: AppTheme.accentPurple,
              onTap: () {
                // TODO: Navigate to Employee module
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Modul Karyawan belum tersedia'),
                    backgroundColor: AppTheme.accentOrange,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon Circle
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
