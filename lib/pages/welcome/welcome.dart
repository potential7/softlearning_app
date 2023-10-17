import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softlearning_app/main.dart';
import 'package:softlearning_app/pages/welcome/blocs/welcome_blocs.dart';
import 'package:softlearning_app/pages/welcome/blocs/welcome_events.dart';
import 'package:softlearning_app/pages/welcome/blocs/welcome_states.dart';

import '../../common/values/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            body: Container(
              margin: EdgeInsets.only(top: 34.h),
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
                          ' We are learning',
                          context,
                          'assets/images/reading.png',
                          'learning is a process all living most experience. no knowledge is a waste',
                          'next'),
                      _page(
                          2,
                          ' Connect With Everyone',
                          context,
                          'assets/images/boy.png',
                          'Always keep in touch with your tutor and everyone. let\'s get connected',
                          'next'),
                      _page(
                          3,
                          ' Always Fascinated Learning',
                          context,
                          'assets/images/man.png',
                          'learning is a process all living most experience',
                          'get started'),
                    ],
                  ),
                  Positioned(
                    bottom: 90.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(18, 8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _page(int index, String title, BuildContext context, String imagePath,
      String subTitle, String buttonName) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
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
          width: 375.w,
          padding: EdgeInsets.only(left: 28.w, right: 28.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeIn);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil('/sign_In', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
