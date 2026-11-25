import 'package:flutter/material.dart';

import '../widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: RetroColors.surface,
                      border: Border.all(color: RetroColors.violet, width: 1.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: RetroColors.highlight,
                          size: 42,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'PASSNOTE',
                          style: TextStyle(
                            color: RetroColors.text,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'v1.0 // LOCAL VAULT',
                          style: TextStyle(
                            color: RetroColors.highlight.withValues(alpha: 0.8),
                            fontSize: 11,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'IDENTIFY YOUR VAULT',
                    style: TextStyle(
                      color: RetroColors.highlight,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Vault ID / Email',
                      hintText: 'kyle.dungo@passnote.local',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Master Password',
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword
                            ? 'Show password'
                            : 'Hide password',
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      child: const Text('UNLOCK VAULT'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.fingerprint),
                      label: const Text('BIOMETRIC UNLOCK'),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'OFFLINE-FIRST  •  HARDWARE-BACKED LOCAL VAULT',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: RetroColors.muted, fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
