import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage_gathering/manage_gathering/bloc/manage_gathering_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/manage_gathering.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/bloc/form_builder_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/drop_down_option/bloc/drop_down_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/muliti_checkbox_option/bloc/multi_checkbox_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/settings/form_builder/screen/radio_option_form.dart/bloc/radio_option_form_bloc.dart';
import 'package:manage_gathering/manage_gathering/screen/ticket_edit/cubit/ticket_edit_cubit.dart';
import 'package:manage_gathering/theme/theme_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FormBuilderBloc(),
        ),
        BlocProvider(
          create: (context) => ManageGatheringBloc(),
        ),
        BlocProvider(
          create: (context) => TicketEditCubit(),
        ),
        BlocProvider(
          create: (context) => RadioOptionFormBloc(),
        ),
        BlocProvider(
          create: (context) => MultiCheckboxBloc(),
        ),
        BlocProvider(
          create: (context) => DropDownBloc(),
        )
      ],
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
