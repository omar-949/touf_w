import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/font_weight_helper.dart';
import 'package:toufwshouf/core/resources/colors.dart';

abstract class TextStyles {
  static TextStyle font24WhiteSemiBold = TextStyle(
    fontSize: 24.sp,
    color: TextColors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16WhiteRegular = TextStyle(
    fontSize: 16.sp,
    color: TextColors.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    color: TextColors.black,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font26Grey800Bold = TextStyle(
    fontSize: 26.sp,
    color: TextColors.grey800,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey600Medium = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey600,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Grey600Regular = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey600,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Grey800Medium = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey800,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16WhiteMedium = TextStyle(
    fontSize: 16.sp,
    color: TextColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Medium = TextStyle(
    fontSize: 14.sp,
    color: TextColors.blue500,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Blue500Bold = TextStyle(
    fontSize: 14.sp,
    color: TextColors.blue500,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey700Medium = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey700,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12Grey500Medium = TextStyle(
    fontSize: 12.sp,
    color: TextColors.grey500,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12Green500Medium = TextStyle(
    fontSize: 12.sp,
    color: TextColors.green500,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font14Grey600SemiBold = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey600,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font16MediumGreyRegular = TextStyle(
    fontSize: 16.sp,
    color: TextColors.mediumGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18WhiteRegular = TextStyle(
    fontSize: 18.sp,
    color: TextColors.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18OrangeRegular = TextStyle(
    fontSize: 18.sp,
    color: TextColors.orange,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16OrangeSemiBold = TextStyle(
    fontSize: 16.sp,
    color: TextColors.orange,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font20BlackMedium = TextStyle(
    fontSize: 20.sp,
    color: TextColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font10MediumGreyRegular = TextStyle(
    fontSize: 10.sp,
    color: TextColors.mediumGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18WhiteMedium = TextStyle(
    fontSize: 18.sp,
    color: TextColors.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    color: TextColors.black,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font16DarkGreyRegular = TextStyle(
    fontSize: 16.sp,
    color: TextColors.darkGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14LightGreyRegular = TextStyle(
    fontSize: 14.sp,
    color: TextColors.lightGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18MediumGreyMedium = TextStyle(
    fontSize: 18.sp,
    color: TextColors.mediumGrey,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font18OrangeMedium = TextStyle(
    fontSize: 18.sp,
    color: TextColors.orange,
    fontWeight: FontWeightHelper.medium,
  );
  ////
  // rania
  static TextStyle font26GreyExtraBold = TextStyle(
    fontSize: 26.sp,
    color: TextColors.grey800,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle font14GreyMedium = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey600,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font13GreyMedium = TextStyle(
    fontSize: 13.sp,
    color: TextColors.grey700,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font13BlueBold = TextStyle(
    fontSize: 13.sp,
    color: TextColors.blue500,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14Grey600Bold = TextStyle(
    fontSize: 14.sp,
    color: TextColors.grey600,
    fontWeight: FontWeightHelper.bold,
  );
  /////////
  //onboarding tasneem
  static TextStyle onboardingTitleStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24.sp,
    fontWeight:FontWeightHelper.semiBold ,
    height: 29.05 / 24,
    letterSpacing: -0.3,
    color: TextColors.white,

  );
  static TextStyle onboardingDescriptionStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    height: 19.36 / 16,
    letterSpacing: -0.3,
    color: TextColors.white,
  );
}
