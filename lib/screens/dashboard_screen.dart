import 'package:flutter/material.dart';

import '../widgets/custom_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _showSecurityStatus(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: RetroColors.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('SECURITY STATUS'),
        content: const Text(
          'LOCAL VAULT ACTIVE\nAES-256 + SQLCIPHER\nNO NETWORK CONNECTION',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE'),
          ),
        ],
      ),
    );
  }

  void _showAudit(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: RetroColors.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('SECURITY AUDIT'),
        content: const Text(
          'VAULT HEALTH: 96%\nCOMPROMISED LOGINS: 0\nLAST CHECK: JUST NOW',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('DONE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PASSNOTE // DASHBOARD'),
        actions: [
          IconButton(
            tooltip: 'Security status',
            onPressed: () => _showSecurityStatus(context),
            icon: const Icon(Icons.shield_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          children: [
            Container(
              decoration: BoxDecoration(
                color: RetroColors.surface,
                border: Border.all(color: RetroColors.violet, width: 1.5),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '> Welcome back, Kyle!',
                    style: TextStyle(
                      color: RetroColors.highlight,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'YOUR LOCAL VAULT IS LOCKED TO THIS DEVICE.',
                    style: TextStyle(color: RetroColors.muted, fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search saved entries...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Expanded(
                  child: RetroSummaryCard(
                    label: 'Stored Logins',
                    value: '24',
                    detail: 'ACROSS 6 CATEGORIES',
                    icon: Icons.key,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: RetroSummaryCard(
                    label: 'Vault Health',
                    value: '96%',
                    detail: '0 COMPROMISED',
                    icon: Icons.verified_user_outlined,
                    accent: RetroColors.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            const RetroSectionHeader(
              title: 'Quick Access',
              trailing: '4 DESTINATIONS',
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.28,
              children: [
                VaultShortcutTile(
                  title: 'Credential Vault',
                  subtitle: '24 SAVED ACCOUNTS',
                  icon: Icons.folder_open_outlined,
                  onTap: () => Navigator.pushNamed(context, '/vault'),
                ),
                VaultShortcutTile(
                  title: 'Key Generator',
                  subtitle: 'CREATE A STRONG KEY',
                  icon: Icons.key_outlined,
                  onTap: () => Navigator.pushNamed(context, '/generator'),
                ),
                VaultShortcutTile(
                  title: 'Security Audit',
                  subtitle: 'HEALTH CHECK: 96%',
                  icon: Icons.fact_check_outlined,
                  onTap: () => _showAudit(context),
                ),
                VaultShortcutTile(
                  title: 'Profile & Security',
                  subtitle: 'LOCAL KEYSTORE',
                  icon: Icons.settings_outlined,
                  onTap: () => Navigator.pushNamed(context, '/profile'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PassNoteBottomNavigationBar(currentIndex: 0),
    );
  }
}
