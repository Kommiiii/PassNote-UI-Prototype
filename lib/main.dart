import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'screens/feature_one_screen.dart';
import 'screens/feature_two_screen.dart';
import 'screens/login_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/custom_widgets.dart';

void main() {
  runApp(const PassNoteApp());
}

class PassNoteApp extends StatelessWidget {
  const PassNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: RetroColors.violet,
      brightness: Brightness.dark,
      surface: RetroColors.surface,
    );

    return MaterialApp(
      title: 'PassNote',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: colorScheme.copyWith(
          primary: RetroColors.violet,
          secondary: RetroColors.highlight,
          surface: RetroColors.surface,
          onSurface: RetroColors.text,
        ),
        scaffoldBackgroundColor: RetroColors.background,
        fontFamily: 'Courier New',
        appBarTheme: const AppBarTheme(
          backgroundColor: RetroColors.background,
          foregroundColor: RetroColors.text,
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: RetroColors.text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontFamily: 'Courier New',
          ),
        ),
        cardTheme: const CardThemeData(
          color: RetroColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: RetroColors.border, width: 1.5),
          ),
          margin: EdgeInsets.zero,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: RetroColors.surface,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: RetroColors.border, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: RetroColors.violet, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: RetroColors.danger, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: RetroColors.danger, width: 1.5),
          ),
          hintStyle: TextStyle(color: RetroColors.muted),
          labelStyle: TextStyle(color: RetroColors.muted),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: RetroColors.violet,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: RetroColors.highlight,
            side: const BorderSide(color: RetroColors.violet, width: 1.5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: RetroColors.surface,
          selectedColor: RetroColors.violet,
          side: BorderSide(color: RetroColors.border, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          labelStyle: TextStyle(color: RetroColors.text, fontSize: 11),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        dividerColor: RetroColors.border,
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? RetroColors.highlight
                : RetroColors.muted,
          ),
          trackColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? RetroColors.violet.withValues(alpha: 0.65)
                : RetroColors.border,
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/vault': (_) => const VaultScreen(),
        '/generator': (_) => const GeneratorScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
    );
  }
}
