import 'package:flutter/material.dart';

import '../widgets/custom_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricUnlock = true;
  bool _autoLock = true;
  bool _clearClipboard = true;

  Widget _settingTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: RetroColors.surface,
        border: Border.all(color: RetroColors.border, width: 1.5),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: const TextStyle(fontSize: 12)),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: RetroColors.muted, fontSize: 10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PROFILE & SECURITY')),
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
              child: Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      color: RetroColors.background,
                      border: Border.all(
                        color: RetroColors.highlight,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'KD',
                      style: TextStyle(
                        color: RetroColors.highlight,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kyle Dungo',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'kyle.dungo@passnote.local',
                          style: TextStyle(
                            color: RetroColors.muted,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(height: 10),
                        _KeyStoreBadge(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const RetroSectionHeader(title: 'Hardware Security'),
            const SizedBox(height: 10),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    _InfoRow(
                      icon: Icons.memory,
                      label: 'VAULT TIER',
                      value: 'Local Hardware Keystore',
                    ),
                    Divider(height: 22),
                    _InfoRow(
                      icon: Icons.enhanced_encryption_outlined,
                      label: 'ENCRYPTION',
                      value: 'AES-256 at rest',
                    ),
                    Divider(height: 22),
                    _InfoRow(
                      icon: Icons.wifi_off_outlined,
                      label: 'NETWORK',
                      value: 'Offline-first',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const RetroSectionHeader(title: 'Security Settings'),
            const SizedBox(height: 10),
            _settingTile(
              title: 'Biometric Unlock',
              subtitle: 'Use device biometrics to unlock',
              value: _biometricUnlock,
              onChanged: (value) => setState(() => _biometricUnlock = value),
            ),
            _settingTile(
              title: 'Auto-Lock After 60s',
              subtitle: 'Lock the vault after inactivity',
              value: _autoLock,
              onChanged: (value) => setState(() => _autoLock = value),
            ),
            _settingTile(
              title: 'Clear Clipboard on Exit',
              subtitle: 'Remove copied secrets when leaving',
              value: _clearClipboard,
              onChanged: (value) => setState(() => _clearClipboard = value),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: RetroColors.danger,
                  side: const BorderSide(color: RetroColors.danger, width: 1.5),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: const Icon(Icons.lock_outline),
                label: const Text('LOCK VAULT (LOGOUT)'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PassNoteBottomNavigationBar(currentIndex: 3),
    );
  }
}

class _KeyStoreBadge extends StatelessWidget {
  const _KeyStoreBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: RetroColors.success, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      child: const Text(
        'ANDROID KEYSTORE ENABLED',
        style: TextStyle(
          color: RetroColors.success,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: RetroColors.highlight, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: RetroColors.muted, fontSize: 9),
              ),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
