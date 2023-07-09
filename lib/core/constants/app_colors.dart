import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();
  static AppColors get instance => _instance;
  AppColors._internal();

  Color scaffoldBackgroundColor = const Color(0xFFEEEEEE);
  Color buttonBgColor = const Color(0xFFFAA885);
  Color lightOrangeColor = const Color(0xFFFFECE4);
  Color textColor = Colors.black.withOpacity(0.8);
  Color whiteColor = Colors.white;
  Color nameTextColor = Colors.white.withOpacity(.8);
  Color iconColor = const Color(0xffB85124);
  Color doneColor = const Color(0xffFAA885);
  Color profileBgColor = const Color(0xffCF7751);
  Color greenColor = const Color.fromARGB(255, 53, 176, 57);
}

class AppStyles {
  static final AppStyles _instance = AppStyles._internal();
  static AppStyles get instance => _instance;
  AppStyles._internal();
  TextStyle boldStyle = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  TextStyle semiBoldStyle = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  TextStyle regularStyle = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );

  TextStyle mediumStyle = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );

  TextStyle doneStyle = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  BoxDecoration customDecoration = CustomDecoration();
}

class CustomDecoration extends BoxDecoration {
  CustomDecoration()
      : super(
            color: AppColors.instance.whiteColor,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ]);
}
