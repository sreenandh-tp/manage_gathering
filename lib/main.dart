import 'package:flutter/material.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      //LIGHT THEME
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 243, 238, 251),
        dialogTheme: const DialogTheme(backgroundColor: Colors.white70),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
        cardTheme: CardTheme(
            color: const Color.fromARGB(255, 243, 238, 251),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(10))),
        outlinedButtonTheme: const OutlinedButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.black),
                side: WidgetStatePropertyAll(BorderSide(color: Colors.black)))),
        popupMenuTheme: const PopupMenuThemeData(iconColor: Colors.black),
        iconButtonTheme: const IconButtonThemeData(
            style:
                ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.black))),
        appBarTheme: const AppBarTheme(color: Colors.white),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          dividerColor: Colors.black26,
        ),
        iconTheme: const IconThemeData(color: Colors.black45),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
          labelLarge: TextStyle(color: Colors.black),
          labelMedium: TextStyle(color: Colors.black),
          labelSmall: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.white,
        chipTheme: const ChipThemeData(
          backgroundColor: Color.fromARGB(255, 245, 240, 255),
        ),
      ),
      // DARK THEME
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        dialogTheme: const DialogTheme(backgroundColor: Colors.black87),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.black87),
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
        cardColor: Colors.black12,
        cardTheme: CardTheme(
            color: Colors.black12,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white30),
                borderRadius: BorderRadius.circular(10))),
        outlinedButtonTheme: const OutlinedButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStatePropertyAll(Colors.white),
                side: WidgetStatePropertyAll(BorderSide(color: Colors.white)))),
        popupMenuTheme: const PopupMenuThemeData(iconColor: Colors.white),
        iconButtonTheme: const IconButtonThemeData(
            style:
                ButtonStyle(iconColor: WidgetStatePropertyAll(Colors.white))),
        appBarTheme: const AppBarTheme(color: Colors.black),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          dividerColor: Colors.white24,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 18),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        chipTheme: const ChipThemeData(backgroundColor: Colors.black),
      ),
      home: const ManageGatheringPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
