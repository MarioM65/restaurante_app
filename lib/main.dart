import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamburgueria do Zé',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
