import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_widgets.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  static const _samples = [
    'x9#mK2\$vP8@qL4!z',
    'T4!wQ7#nB2\$xR9@p',
    'h8@Z3\$kV6!mC1#y',
  ];

  double _length = 16;
  int _sampleIndex = 0;
  final Map<String, bool> _characterSets = {
    'Uppercase A-Z': true,
    'Lowercase a-z': true,
    'Numbers 0-9': true,
    'Symbols !@#\$': true,
  };

  String get _password => _samples[_sampleIndex];

  Future<void> _copyPassword() async {
    await Clipboard.setData(ClipboardData(text: _password));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Generated key copied')));
  }

  @override
  Widget build(BuildContext context) {
    final options = _characterSets.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('KEY GENERATOR')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          children: [
            const RetroSectionHeader(
              title: 'Generated Output',
              trailing: 'LOCAL PREVIEW',
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: RetroColors.surface,
                border: Border.all(color: RetroColors.violet, width: 1.5),
              ),
              padding: const EdgeInsets.fromLTRB(16, 19, 8, 19),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      _password,
                      style: const TextStyle(
                        color: RetroColors.highlight,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Copy key',
                    onPressed: _copyPassword,
                    icon: const Icon(Icons.copy_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bolt, color: RetroColors.success, size: 19),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'STRENGTH: EXCELLENT (128-BIT ENTROPY)',
                            style: TextStyle(
                              color: RetroColors.success,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: LinearProgressIndicator(
                        value: 0.96,
                        minHeight: 8,
                        backgroundColor: RetroColors.border,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          RetroColors.success,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'ESTIMATED CRACK TIME: CENTURIES',
                      style: TextStyle(color: RetroColors.muted, fontSize: 9),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            RetroSectionHeader(
              title: 'Key Length',
              trailing: 'Length: ${_length.round()} chars',
            ),
            Slider(
              value: _length,
              min: 8,
              max: 32,
              divisions: 24,
              label: '${_length.round()}',
              onChanged: (value) => setState(() => _length = value),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '8 CHAR',
                  style: TextStyle(color: RetroColors.muted, fontSize: 9),
                ),
                Text(
                  '32 CHAR',
                  style: TextStyle(color: RetroColors.muted, fontSize: 9),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const RetroSectionHeader(
              title: 'Character Sets',
              trailing: 'SELECT OPTIONS',
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.25,
              children: options.map((option) {
                final enabled = option.value;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _characterSets[option.key] = !enabled;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: RetroColors.surface,
                      border: Border.all(
                        color:
                            enabled ? RetroColors.violet : RetroColors.border,
                        width: 1.5,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(
                          enabled
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          color: enabled
                              ? RetroColors.highlight
                              : RetroColors.muted,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            option.key,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _sampleIndex = (_sampleIndex + 1) % _samples.length;
                  });
                },
                icon: const Icon(Icons.autorenew),
                label: const Text('GENERATE NEW KEY'),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'PREVIEW ONLY — NO KEY IS STORED OR TRANSMITTED.',
              textAlign: TextAlign.center,
              style: TextStyle(color: RetroColors.muted, fontSize: 9),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const PassNoteBottomNavigationBar(currentIndex: 2),
    );
  }
}
