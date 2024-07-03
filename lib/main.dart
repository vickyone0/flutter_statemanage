import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statemanage/app_blocs.dart';
import 'package:flutter_statemanage/pages/sign_in/sign_in.dart';
import 'package:flutter_statemanage/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_statemanage/pages/welcome/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
 @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
            create: (context) => WelcomeBloc(),
    
            ),
            BlocProvider(
                create: (context) => AppBlocs(),
            ),
        ],
                child: ScreenUtilInit(
            designSize: Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
              home: const Welcome(),
              routes: {
                "myHomePage" : (context) => const Welcome(),
                "signIn" : (context) => const SignIn(),
              },
    ),
    )
    );
  }
}

