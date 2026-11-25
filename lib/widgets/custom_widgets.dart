import 'package:flutter/material.dart';

class RetroColors {
  static const background = Color(0xFF121216);
  static const surface = Color(0xFF1C1C24);
  static const violet = Color(0xFF6C5CE7);
  static const highlight = Color(0xFFE0B0FF);
  static const border = Color(0xFF3A3A4A);
  static const text = Color(0xFFEAE7F2);
  static const muted = Color(0xFF9290A0);
  static const success = Color(0xFF72D6A0);
  static const danger = Color(0xFFFF7188);
}

class RetroSectionHeader extends StatelessWidget {
  const RetroSectionHeader({required this.title, this.trailing, super.key});

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: RetroColors.highlight,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
          ),
        ),
        const Spacer(),
        if (trailing != null)
          Text(
            trailing!,
            style: const TextStyle(color: RetroColors.muted, fontSize: 11),
          ),
      ],
    );
  }
}

class RetroSummaryCard extends StatelessWidget {
  const RetroSummaryCard({
    required this.label,
    required this.value,
    required this.detail,
    required this.icon,
    this.accent = RetroColors.highlight,
    super.key,
  });

  final String label;
  final String value;
  final String detail;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: accent, size: 20),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                color: accent,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              detail,
              style: const TextStyle(color: RetroColors.muted, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class VaultShortcutTile extends StatelessWidget {
  const VaultShortcutTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: RetroColors.surface,
          border: Border.all(color: RetroColors.border, width: 1.5),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: RetroColors.highlight, size: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: RetroColors.muted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PassNoteBottomNavigationBar extends StatelessWidget {
  const PassNoteBottomNavigationBar({required this.currentIndex, super.key});

  final int currentIndex;

  static const _routes = ['/dashboard', '/vault', '/generator', '/profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: RetroColors.border, width: 1.5)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: RetroColors.background,
        selectedItemColor: RetroColors.highlight,
        unselectedItemColor: RetroColors.muted,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index != currentIndex) {
            Navigator.pushReplacementNamed(context, _routes[index]);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_outlined),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            label: 'VAULT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key_outlined),
            label: 'KEYGEN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
