
import 'dart:js_interop';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statemanage/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_statemanage/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_statemanage/pages/welcome/bloc/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (BuildContext context, WelcomeState state) {
        return Container(
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                      1,
                      context,
                      "Next",
                      "First See Learing",
                      "Forget about a for of paper all knowledge in one learning!",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friend. let’s get connected!",
                      "assets/images/man.png"),
                  _page(
                      3,
                      context,
                      "get started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                      "assets/images/boy.png")
                ],
              ),
              Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                      mainAxisAlignment: MainAxisAlignment.center,
                      reversed: false,
                      dotsCount: 3,
                      position: state.page.toDouble(),
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      )))
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
            child: Container(
                width: 325.w,
                height: 50.h,
                margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  buttonName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ))),
            onTap: () {
              if (index < 3) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route)=> false);
              }
            })
      ],
    );
  }
}
