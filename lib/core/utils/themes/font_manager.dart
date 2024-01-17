import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontManagerStyle{
  
  final TextStyle basicTextStyle =TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500
  );

   TextStyle get titleTextStyle=> basicTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
   );
  
   TextStyle get buttonTextStyle=> basicTextStyle.copyWith(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
   );

   TextStyle get mediumTextStyle=> basicTextStyle.copyWith(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
   );

   TextStyle get subtitleTextStyle=> basicTextStyle.copyWith(
    color: Colors.white.withOpacity(.8),
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.15,
   );

   TextStyle get labelTextStyle=> basicTextStyle.copyWith(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
   );

}