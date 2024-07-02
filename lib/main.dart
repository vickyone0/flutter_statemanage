import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statemanage/app_blocs.dart';
import 'package:flutter_statemanage/app_events.dart';
import 'package:flutter_statemanage/app_states.dart';
import 'package:flutter_statemanage/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_statemanage/pages/welcome/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
 @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WelcomeBloc(),
        child: ScreenUtilInit(
        designSize: Size(375, 812),
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
          home: Welcome(),
        )));
  }
}

