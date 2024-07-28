import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_theme.dart';
import 'package:flutter_dev_test/components/ringo_text_field.dart';
import 'package:flutter_dev_test/login_page.dart';
import 'package:flutter_dev_test/main_page.dart';

import 'components/ringo_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ringo Demo',
      theme: appTheme,
      home: const LoginPage(),
    );
  }
}