import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softlearning_app/common/values/colors.dart';
import 'package:softlearning_app/pages/application/application_widget.dart';
import 'package:softlearning_app/pages/application/bloc/app_events.dart';
import 'bloc/app_blocs.dart';
import 'bloc/app_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(
      builder: (context, state) {
        return Container(
          child: Scaffold(
            body: buildPage(_index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 70.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ]),
              child: BottomNavigationBar(
                onTap: (value) {
                  context.read<AppBlocs>().add(TriggerAppEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _index,
                items: [
                  BottomNavigationBarItem(
                    label: 'home',
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.h,
                      child: Image.asset('assets/icons/home.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.h,
                      child: Image.asset(
                        'assets/icons/home.png',
                        color: AppColors.primaryElement,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                      label: 'search',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/search2.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/search2.png',
                          color: AppColors.primaryElement,
                        ),
                      )),
                  BottomNavigationBarItem(
                      label: 'course ',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/play-circle1.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/play-circle1.png',
                          color: AppColors.primaryElement,
                        ),
                      )),
                  BottomNavigationBarItem(
                    label: 'chat',
                    icon: SizedBox(
                      width: 15.w,
                      height: 15.h,
                      child: Image.asset('assets/icons/message-circle.png'),
                    ),
                    activeIcon: SizedBox(
                      width: 15.w,
                      height: 15.h,
                      child: Image.asset(
                        'assets/icons/message-circle.png',
                        color: AppColors.primaryElement,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                      label: 'profile',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset('assets/icons/person.png'),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          'assets/icons/person.png',
                          color: AppColors.primaryElement,
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
