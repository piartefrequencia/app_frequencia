

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProCidadaniaApp());
}

class ProCidadaniaApp extends StatelessWidget {
  const ProCidadaniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro-Cidadania',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), 
    );
  }
}