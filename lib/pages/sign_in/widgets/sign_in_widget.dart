import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, right: 25.w, left: 25.w,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reuseAbleIcon("google"),
        reuseAbleIcon("apple"),
        reuseAbleIcon("facebook"),
      ],
    ),
  );
}

Widget reuseAbleIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reuseAbleText(String text) {
  return Container(
    margin: EdgeInsets.only(top: 15.h, bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(fontSize: 14.sp, color: Colors.grey.withOpacity(0.5)),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName, void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: AppColors.primaryFourElementText),
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        Container(
          padding: EdgeInsets.only(top: 3.h),
          height: 50.h,
          width: 270.w,
          child: TextField(
            onChanged: (value)=>func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: const TextStyle(color: AppColors.primarySecondaryElementText),
            ),
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'Avenir'),
            autocorrect: false,
            obscureText: textType == 'Password' ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(top: 25.h),
      width: 260.w,
      height: 44.h,
      child: Text(
        'Forgot password?',
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType, func) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 323.w,
      height: 50.h,
      margin: EdgeInsets.only(top: buttonType=='login'?40.h:20.h),
      decoration: BoxDecoration(
        color: buttonType== 'login'?AppColors.primaryElement:AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: buttonType== 'login'?Colors.transparent:AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 1),
          )
        ]
      ),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            color: buttonType== 'login'?AppColors.primaryBackground:AppColors.primaryText, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),),
    ),
  );
}
