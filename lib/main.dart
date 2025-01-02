import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/theme/theme_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 
    return BlocProvider(
      create: (context) => FormBuilderBloc(),
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeClass().lightTheme,
        darkTheme: ThemeClass().darkTheme,
        home: const ManageGatheringPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
