import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  ///Black
  static const black = TextStyle(color: Colors.black);

  //s10
  static final blackS10 = black.copyWith(fontSize: 10);
  static final blackS10Bold = blackS10.copyWith(fontWeight: FontWeight.bold);
  static final blackS10W800 =
      blackS10.copyWith(fontWeight: FontWeight.w800); //s12
  static final blackS12 = black.copyWith(fontSize: 12);
  static final blackS12Bold = blackS12.copyWith(fontWeight: FontWeight.bold);
  static final blackS12W800 = blackS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final blackS14 = black.copyWith(fontSize: 14);
  static final blackS14Bold = blackS14.copyWith(fontWeight: FontWeight.bold);
  static final blackS14SemiBold =
      blackS14.copyWith(fontWeight: FontWeight.w600);
  static final blackS14W800 = blackS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final blackS16 = black.copyWith(fontSize: 14);
  static final blackS16Bold = blackS16.copyWith(fontWeight: FontWeight.bold);
  static final blackS16W800 = blackS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final blackS18 = black.copyWith(fontSize: 18);
  static final blackS18Bold = blackS18.copyWith(fontWeight: FontWeight.bold);
  static final blackS18W800 = blackS18.copyWith(fontWeight: FontWeight.w800);
  //s24
  static final blackS24 = black.copyWith(fontSize: 24);
  static final blackS24Bold = blackS24.copyWith(fontWeight: FontWeight.bold);
  static final blackS24W800 = blackS24.copyWith(fontWeight: FontWeight.w800);

  ///White
  static const white = TextStyle(color: Colors.white);

  //s10
  static final whiteS10 = white.copyWith(fontSize: 10);
  static final whiteS10Bold = whiteS10.copyWith(fontWeight: FontWeight.bold);
  static final whiteS10W800 = whiteS10.copyWith(fontWeight: FontWeight.w800);
  //s12
  static final whiteS12 = white.copyWith(fontSize: 12);
  static final whiteS12Bold = whiteS12.copyWith(fontWeight: FontWeight.bold);
  static final whiteS12W800 = whiteS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final whiteS14 = white.copyWith(fontSize: 14);
  static final whiteS14Bold = whiteS14.copyWith(fontWeight: FontWeight.bold);
  static final whiteS14W800 = whiteS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final whiteS16 = white.copyWith(fontSize: 16);
  static final whiteS16Bold = whiteS16.copyWith(fontWeight: FontWeight.bold);
  static final whiteS16W800 = whiteS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS18W800 = whiteS18.copyWith(fontWeight: FontWeight.w800);

  ///Gray
  static const grey = TextStyle(color: AppColors.gray);

  //s10
  static final greyS10 = grey.copyWith(fontSize: 10);
  static final greyS10Bold = greyS10.copyWith(fontWeight: FontWeight.bold);
  static final greyS10W800 = greyS10.copyWith(fontWeight: FontWeight.w800);
  //s12
  static final greyS12 = grey.copyWith(fontSize: 12);
  static final greyS12Bold = greyS12.copyWith(fontWeight: FontWeight.bold);
  static final greyS12W800 = greyS12.copyWith(fontWeight: FontWeight.w800);

  //s14
  static final greyS14 = grey.copyWith(fontSize: 14);
  static final greyS14Bold = greyS14.copyWith(fontWeight: FontWeight.bold);
  static final greyS14W800 = greyS14.copyWith(fontWeight: FontWeight.w800);

  //s16
  static final greyS16 = grey.copyWith(fontSize: 16);
  static final greyS16Bold = greyS16.copyWith(fontWeight: FontWeight.bold);
  static final greyS16W800 = greyS16.copyWith(fontWeight: FontWeight.w800);

  //s18
  static final greyS18 = grey.copyWith(fontSize: 18);
  static final greyS18Bold = greyS18.copyWith(fontWeight: FontWeight.bold);
  static final greyS18W800 = greyS18.copyWith(fontWeight: FontWeight.w800);

  ///Tint
  static const blue = TextStyle(color: AppColors.blue);

  //s10
  static final blueS10 = blue.copyWith(fontSize: 10);
  static final blueS10Bold = blueS10.copyWith(fontWeight: FontWeight.bold);
  static final blueS10W800 = blueS10.copyWith(fontWeight: FontWeight.w800);
  //s12
  static final blueS16 = blue.copyWith(fontSize: 16);
  static final blueS16Bold = blueS16.copyWith(fontWeight: FontWeight.bold);
  static final blueS16W800 = blueS16.copyWith(fontWeight: FontWeight.w800);
}
