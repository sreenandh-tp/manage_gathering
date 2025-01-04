import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering.dart';
import 'package:manage_gathering/theme/theme_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeClass().lightTheme,
      darkTheme: ThemeClass().darkTheme,
      home: const ManageGatheringPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
