import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_widgets.dart';

class _Credential {
  const _Credential({
    required this.service,
    required this.username,
    required this.category,
    required this.icon,
  });

  final String service;
  final String username;
  final String category;
  final IconData icon;
}

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  static const _categories = ['ALL', 'SOCIAL', 'FINANCE', 'DEV'];
  static const _credentials = [
    _Credential(
      service: 'GitHub',
      username: 'kyle.dungo',
      category: 'DEV',
      icon: Icons.code,
    ),
    _Credential(
      service: 'NTC Student Portal',
      username: '2024-01842',
      category: 'FINANCE',
      icon: Icons.school_outlined,
    ),
    _Credential(
      service: 'GCash / Banking',
      username: 'kyle.dungo@wallet',
      category: 'FINANCE',
      icon: Icons.account_balance_wallet_outlined,
    ),
    _Credential(
      service: 'Discord',
      username: 'kyle_dungo',
      category: 'SOCIAL',
      icon: Icons.forum_outlined,
    ),
  ];

  String _selectedCategory = 'ALL';
  String _query = '';
  final Set<String> _visiblePasswords = {};

  List<_Credential> get _filteredCredentials {
    return _credentials.where((credential) {
      final matchesCategory = _selectedCategory == 'ALL' ||
          credential.category == _selectedCategory;
      final searchText =
          '${credential.service} ${credential.username} ${credential.category}'
              .toLowerCase();
      return matchesCategory && searchText.contains(_query.toLowerCase());
    }).toList();
  }

  Future<void> _copyUsername(_Credential credential) async {
    await Clipboard.setData(ClipboardData(text: credential.username));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${credential.service} username copied')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final credentials = _filteredCredentials;

    return Scaffold(
      appBar: AppBar(title: const Text('CREDENTIAL VAULT')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          children: [
            TextField(
              onChanged: (value) => setState(() => _query = value.trim()),
              decoration: const InputDecoration(
                hintText: 'Search credentials...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: category == _selectedCategory,
                      onSelected: (_) {
                        setState(() => _selectedCategory = category);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: RetroColors.surface,
                border: Border.all(color: RetroColors.success, width: 1.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
              child: const Row(
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                    color: RetroColors.success,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'AES-256 + SQLCipher Active',
                      style: TextStyle(
                        color: RetroColors.success,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'LOCAL',
                    style: TextStyle(color: RetroColors.muted, fontSize: 9),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RetroSectionHeader(
              title: 'Saved Credentials',
              trailing: '${credentials.length} SHOWN',
            ),
            const SizedBox(height: 12),
            if (credentials.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'NO CREDENTIALS MATCH THIS FILTER.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: RetroColors.muted, fontSize: 11),
                ),
              ),
            ...credentials.map((credential) {
              final isVisible = _visiblePasswords.contains(credential.service);
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              credential.icon,
                              color: RetroColors.highlight,
                              size: 21,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                credential.service,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: RetroColors.violet,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 4,
                              ),
                              child: Text(
                                credential.category,
                                style: const TextStyle(
                                  color: RetroColors.highlight,
                                  fontSize: 9,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'USERNAME',
                          style: TextStyle(
                            color: RetroColors.muted,
                            fontSize: 9,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          credential.username,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'PASSWORD',
                          style: TextStyle(
                            color: RetroColors.muted,
                            fontSize: 9,
                            letterSpacing: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                isVisible ? 'SampleKey!24' : '••••••••••••',
                                style: const TextStyle(
                                  color: RetroColors.highlight,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            IconButton(
                              tooltip:
                                  isVisible ? 'Hide password' : 'View password',
                              visualDensity: VisualDensity.compact,
                              onPressed: () {
                                setState(() {
                                  if (isVisible) {
                                    _visiblePasswords.remove(
                                      credential.service,
                                    );
                                  } else {
                                    _visiblePasswords.add(credential.service);
                                  }
                                });
                              },
                              icon: Icon(
                                isVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 19,
                              ),
                            ),
                            IconButton(
                              tooltip: 'Copy username',
                              visualDensity: VisualDensity.compact,
                              onPressed: () => _copyUsername(credential),
                              icon: const Icon(Icons.copy_outlined, size: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: const PassNoteBottomNavigationBar(currentIndex: 1),
    );
  }
}
